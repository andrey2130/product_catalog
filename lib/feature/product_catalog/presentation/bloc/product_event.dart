part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.loadAllProducts() = LoadAllProducts;
  const factory ProductEvent.toggleFavorite(String productId) = ToggleFavorite;
  const factory ProductEvent.searchProducts(String query) = SearchProducts;
}
