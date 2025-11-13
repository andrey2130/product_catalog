part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = Initial;
  const factory CartState.loading() = Loading;
  const factory CartState.loaded(List<ProductModel> products, double total) =
      Loaded;
  const factory CartState.failure(String message) = Failure;
}
