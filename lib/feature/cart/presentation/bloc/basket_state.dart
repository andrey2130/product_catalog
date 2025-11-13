part of 'basket_bloc.dart';

@freezed
class BasketState with _$BasketState {
  const factory BasketState.initial() = Initial;
  const factory BasketState.loading() = Loading;
  const factory BasketState.loaded(List<ProductModel> products, double total) =
      Loaded;
  const factory BasketState.failure(String message) = Failure;
}
