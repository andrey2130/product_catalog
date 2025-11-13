import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:catalog_product/core/usecases/usecase.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/cart/domain/usecases/get_bascket_products_usecase.dart';
import 'package:catalog_product/feature/cart/domain/usecases/remove_from_basket_usecase.dart';
import 'package:catalog_product/feature/cart/domain/usecases/update_basket_quantity_usecase.dart';

part 'basket_event.dart';
part 'basket_state.dart';
part 'basket_bloc.freezed.dart';

@Injectable()
class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final GetBascketProductsUsecase _getBasketProductsUsecase;
  final RemoveFromBasketUsecase _removeFromBasketUsecase;
  final UpdateBasketQuantityUsecase _updateBasketQuantityUsecase;

  BasketBloc(
    this._getBasketProductsUsecase,
    this._removeFromBasketUsecase,
    this._updateBasketQuantityUsecase,
  ) : super(const BasketState.initial()) {
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
    Emitter<BasketState> emit,
  ) async {
    emit(const BasketState.loading());

    final result = await _getBasketProductsUsecase(const NoParams());

    result.fold((failure) => emit(BasketState.failure(failure.message)), (
      products,
    ) {
      final total = _calculateTotal(products);
      emit(BasketState.loaded(products, total));
    });
  }

  Future<void> _increaseQuantity(
    IncreaseQuantity event,
    Emitter<BasketState> emit,
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
        final result = await _getBasketProductsUsecase(const NoParams());
        result.fold(
          (failure) => emit(BasketState.failure(failure.message)),
          (updatedProducts) {
            final newTotal = _calculateTotal(updatedProducts);
            emit(BasketState.loaded(updatedProducts, newTotal));
          },
        );
      },
      orElse: () async {},
    );
  }

  Future<void> _decreaseQuantity(
    DecreaseQuantity event,
    Emitter<BasketState> emit,
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
        final result = await _getBasketProductsUsecase(const NoParams());
        result.fold(
          (failure) => emit(BasketState.failure(failure.message)),
          (updatedProducts) {
            final newTotal = _calculateTotal(updatedProducts);
            emit(BasketState.loaded(updatedProducts, newTotal));
          },
        );
      },
      orElse: () async {},
    );
  }

  Future<void> _removeProduct(
    RemoveProduct event,
    Emitter<BasketState> emit,
  ) async {
    // Save to SharedPreferences
    await _removeFromBasketUsecase(event.productId);

    // Reload basket products to get updated state
    final result = await _getBasketProductsUsecase(const NoParams());
    result.fold(
      (failure) => emit(BasketState.failure(failure.message)),
      (products) {
        final total = _calculateTotal(products);
        emit(BasketState.loaded(products, total));
      },
    );
  }
}
