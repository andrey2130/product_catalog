part of 'favorites_bloc.dart';

@freezed
class FavoritesEvent with _$FavoritesEvent {
  const factory FavoritesEvent.loadFavoriteProducts() = LoadFavoriteProducts;
  const factory FavoritesEvent.removeFavorite(String productId) = RemoveFavorite;
}

