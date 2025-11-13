import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:catalog_product/core/usecases/usecase.dart';
import 'package:catalog_product/core/usecases/search_products_usecase.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/favorites/domain/usecases/get_favorite_products_usecase.dart';
import 'package:catalog_product/feature/product_catalog/domain/usecase/toggle_favorite_usecase.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';
part 'favorites_bloc.freezed.dart';

@Injectable()
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoriteProductsUsecase _getFavoriteProductsUsecase;
  final ToggleFavoriteUsecase _toggleFavoriteUsecase;
  final SearchProductsUsecase _searchProductsUsecase;

  FavoritesBloc(
    this._getFavoriteProductsUsecase,
    this._toggleFavoriteUsecase,
    this._searchProductsUsecase,
  ) : super(const FavoritesState.initial()) {
    on<LoadFavoriteProducts>(_loadFavoriteProducts);
    on<RemoveFavorite>(_removeFavorite);
    on<SearchProducts>(_searchProducts);
  }

  Future<void> _loadFavoriteProducts(
    LoadFavoriteProducts event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(const FavoritesState.loading());

    final result = await _getFavoriteProductsUsecase(const NoParams());

    result.fold(
      (failure) => emit(FavoritesState.failure(failure.message)),
      (products) => emit(
        FavoritesState.loaded(
          products,
          searchQuery: '',
          allProducts: products,
        ),
      ),
    );
  }

  Future<void> _removeFavorite(
    RemoveFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    final currentState = state;

    await _toggleFavoriteUsecase(event.productId);

    currentState.maybeWhen(
      loaded: (products, searchQuery, allProducts) {
        final updated = products
            .where((p) => p.productId != event.productId)
            .toList();
        final updatedAll = allProducts
            .where((p) => p.productId != event.productId)
            .toList();
        emit(
          FavoritesState.loaded(
            updated,
            searchQuery: searchQuery,
            allProducts: updatedAll,
          ),
        );
      },
      orElse: () {},
    );
  }

  void _searchProducts(SearchProducts event, Emitter<FavoritesState> emit) {
    final currentState = state;

    if (currentState is Loaded) {
      final filteredProducts = _searchProductsUsecase(
        products: currentState.allProducts,
        query: event.query,
      );

      emit(
        FavoritesState.loaded(
          filteredProducts,
          searchQuery: event.query.trim(),
          allProducts: currentState.allProducts,
        ),
      );
    }
  }
}

