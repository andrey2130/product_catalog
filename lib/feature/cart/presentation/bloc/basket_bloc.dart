import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:catalog_product/core/usecases/usecase.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/cart/domain/usecases/get_bascket_products_usecase.dart';

part 'basket_event.dart';
part 'basket_state.dart';
part 'basket_bloc.freezed.dart';

@Injectable()
class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final GetBascketProductsUsecase _getBasketProductsUsecase;

  BasketBloc(this._getBasketProductsUsecase)
    : super(const BasketState.initial()) {
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

  void _increaseQuantity(IncreaseQuantity event, Emitter<BasketState> emit) {
    state.maybeWhen(
      loaded: (products, total) {
        final updated = products.map((p) {
          if (p.productId == event.productId) {
            final newQuantity = (p.quantity) + 1;
            return p.copyWith(quantity: newQuantity, inBasket: true);
          }
          return p;
        }).toList();

        final newTotal = _calculateTotal(updated);
        emit(BasketState.loaded(updated, newTotal));
      },
      orElse: () {},
    );
  }

  void _decreaseQuantity(DecreaseQuantity event, Emitter<BasketState> emit) {
    state.maybeWhen(
      loaded: (products, total) {
        final updated = products
            .map((p) {
              if (p.productId == event.productId) {
                final newQuantity = (p.quantity) - 1;
                if (newQuantity <= 0) {
                  return null;
                }
                return p.copyWith(quantity: newQuantity);
              }
              return p;
            })
            .whereType<ProductModel>()
            .toList();

        final newTotal = _calculateTotal(updated);
        emit(BasketState.loaded(updated, newTotal));
      },
      orElse: () {},
    );
  }

  void _removeProduct(RemoveProduct event, Emitter<BasketState> emit) {
    state.maybeWhen(
      loaded: (products, total) {
        final updated = products
            .where((p) => p.productId != event.productId)
            .toList();

        final newTotal = _calculateTotal(updated);
        emit(BasketState.loaded(updated, newTotal));
      },
      orElse: () {},
    );
  }
}
