import 'package:catalog_product/feature/cart/domain/repository/basket_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/cart/domain/usecases/remove_from_basket_usecase.dart';
import 'package:catalog_product/feature/cart/domain/usecases/update_basket_quantity_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'basket_bloc.freezed.dart';

@Injectable()
class CartBloc extends Bloc<CartEvent, CartState> {
  final BasketRepository _basketRepository;
  final RemoveFromBasketUsecase _removeFromBasketUsecase;
  final UpdateBasketQuantityUsecase _updateBasketQuantityUsecase;

  CartBloc(
    this._basketRepository,
    this._removeFromBasketUsecase,
    this._updateBasketQuantityUsecase,
  ) : super(const CartState.initial()) {
    on<LoadBasketProducts>(_loadBasketProducts);
    on<IncreaseQuantity>(_increaseQuantity);
    on<DecreaseQuantity>(_decreaseQuantity);
    on<RemoveProduct>(_removeProduct);
  }

  double _calculateTotal(List<ProductModel> products) {
    return products.fold<double>(
      0,
      (sum, product) => sum + product.price * product.quantity,
    );
  }

  Future<void> _loadBasketProducts(
    LoadBasketProducts event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());

    final result = await _basketRepository.getBasketProducts();

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

        // Save to SharedPreferences
        await _updateBasketQuantityUsecase(
          UpdateBasketQuantityParams(
            productId: event.productId,
            quantity: newQuantity,
          ),
        );

        // Reload basket products to get updated state
        final result = await _basketRepository.getBasketProducts();
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
          // Remove from basket
          await _removeFromBasketUsecase(event.productId);
        } else {
          // Update quantity
          await _updateBasketQuantityUsecase(
            UpdateBasketQuantityParams(
              productId: event.productId,
              quantity: newQuantity,
            ),
          );
        }

        // Reload basket products to get updated state
        final result = await _basketRepository.getBasketProducts();
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
    // Save to SharedPreferences
    await _removeFromBasketUsecase(event.productId);

    // Reload basket products to get updated state
    final result = await _basketRepository.getBasketProducts();
    result.fold(
      (failure) => emit(CartState.failure(failure.message)),
      (products) {
        final total = _calculateTotal(products);
        emit(CartState.loaded(products, total));
      },
    );
  }
}
