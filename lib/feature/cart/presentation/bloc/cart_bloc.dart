import 'package:catalog_product/feature/cart/domain/repository/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:catalog_product/feature/cart/domain/usecases/update_cart_quantity_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

@Injectable()
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;
  final RemoveFromCartUsecase _removeFromCartUsecase;
  final UpdateCartQuantityUsecase _updateCartQuantityUsecase;

  CartBloc(
    this._cartRepository,
    this._removeFromCartUsecase,
    this._updateCartQuantityUsecase,
  ) : super(const CartState.initial()) {
    on<LoadCartProducts>(_loadCartProducts);
    on<IncreaseQuantity>(_increaseQuantity);
    on<DecreaseQuantity>(_decreaseQuantity);
    on<RemoveProduct>(_removeProduct);
    on<ClearCart>(_clearCart);
  }

  double _calculateTotal(List<ProductModel> products) {
    return products.fold<double>(
      0,
      (sum, product) => sum + product.price * product.quantity,
    );
  }

  Future<void> _loadCartProducts(
    LoadCartProducts event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());

    final result = await _cartRepository.getCartProducts();

    result.fold((failure) => emit(CartState.failure(failure.message)), (
      products,
    ) {
      final total = _calculateTotal(products);
      emit(CartState.loaded(products, total));
    });
  }

  Future<void> _increaseQuantity(
    IncreaseQuantity event,
    Emitter<CartState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (products, total) async {
        final product = products.firstWhere(
          (p) => p.productId == event.productId,
          orElse: () => products.first,
        );
        final newQuantity = product.quantity + 1;

        
        await _updateCartQuantityUsecase(
          UpdateCartQuantityParams(
            productId: event.productId,
            quantity: newQuantity,
          ),
        );

        
        final result = await _cartRepository.getCartProducts();
        result.fold(
          (failure) => emit(CartState.failure(failure.message)),
          (updatedProducts) {
            final newTotal = _calculateTotal(updatedProducts);
            emit(CartState.loaded(updatedProducts, newTotal));
          },
        );
      },
      orElse: () async {},
    );
  }

  Future<void> _decreaseQuantity(
    DecreaseQuantity event,
    Emitter<CartState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (products, total) async {
        final product = products.firstWhere(
          (p) => p.productId == event.productId,
          orElse: () => products.first,
        );
        final newQuantity = product.quantity - 1;

        if (newQuantity <= 0) {

          await _removeFromCartUsecase(event.productId);
        } else {

          await _updateCartQuantityUsecase(
            UpdateCartQuantityParams(
              productId: event.productId,
              quantity: newQuantity,
            ),
          );
        }

        final result = await _cartRepository.getCartProducts();
        result.fold(
          (failure) => emit(CartState.failure(failure.message)),
          (updatedProducts) {
            final newTotal = _calculateTotal(updatedProducts);
            emit(CartState.loaded(updatedProducts, newTotal));
          },
        );
      },
      orElse: () async {},
    );
  }

  Future<void> _removeProduct(
    RemoveProduct event,
    Emitter<CartState> emit,
  ) async {
    
    await _removeFromCartUsecase(event.productId);

    
    final result = await _cartRepository.getCartProducts();
    result.fold(
      (failure) => emit(CartState.failure(failure.message)),
      (products) {
        final total = _calculateTotal(products);
        emit(CartState.loaded(products, total));
      },
    );
  }

  Future<void> _clearCart(
    ClearCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());

    final result = await _cartRepository.clearCart();
    
    await result.fold(
      (failure) async {
        emit(CartState.failure(failure.message));
      },
      (_) async {
        
        final reloadResult = await _cartRepository.getCartProducts();
        reloadResult.fold(
          (failure) => emit(CartState.failure(failure.message)),
          (products) {
            final total = _calculateTotal(products);
            emit(CartState.loaded(products, total));
          },
        );
      },
    );
  }
}
