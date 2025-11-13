part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.loadCartProducts() = LoadCartProducts;
  const factory CartEvent.increaseQuantity(String productId) = IncreaseQuantity;
  const factory CartEvent.decreaseQuantity(String productId) = DecreaseQuantity;
  const factory CartEvent.removeProduct(String productId) = RemoveProduct;
}
