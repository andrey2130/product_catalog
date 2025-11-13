part of 'favorites_bloc.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = Initial;
  const factory FavoritesState.loading() = Loading;
  const factory FavoritesState.loaded(List<ProductModel> products) = Loaded;
  const factory FavoritesState.failure(String message) = Failure;
}

