part of 'basket_bloc.dart';

@freezed
class BasketEvent with _$BasketEvent {
  const factory BasketEvent.loadBasketProducts() = LoadBasketProducts;
  const factory BasketEvent.increaseQuantity(String productId) =
      IncreaseQuantity;
  const factory BasketEvent.decreaseQuantity(String productId) =
      DecreaseQuantity;
  const factory BasketEvent.removeProduct(String productId) = RemoveProduct;
}
