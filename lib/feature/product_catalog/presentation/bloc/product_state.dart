part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = Initial;
  const factory ProductState.loading() = Loading;
  const factory ProductState.loaded(
    List<ProductModel> products, {
    @Default('') String searchQuery,
    @Default([]) List<ProductModel> allProducts,
  }) = Loaded;
  const factory ProductState.failure(String message) = Failure;
}
