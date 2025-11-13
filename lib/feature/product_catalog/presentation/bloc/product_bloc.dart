import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:catalog_product/core/usecases/usecase.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/product_catalog/domain/usecase/get_all_product_usecase.dart';
import 'package:catalog_product/feature/product_catalog/domain/usecase/toggle_favorite_usecase.dart';
import 'package:catalog_product/feature/cart/domain/usecases/add_to_cart_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

@Injectable()
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProductUsecase _getAllProductUsecase;
  final ToggleFavoriteUsecase _toggleFavoriteUsecase;
  final AddToCartUsecase _addToCartUsecase;

  ProductBloc(
    this._getAllProductUsecase,

    this._toggleFavoriteUsecase,
    this._addToCartUsecase,
  ) : super(const ProductState.initial()) {
    on<LoadAllProducts>(_loadAllproducts);
    on<ToggleFavorite>(_toggleFavorite);
    on<SearchProducts>(_searchProducts);
    on<AddToBasket>(_addToBasket);
  }

  Future<void> _loadAllproducts(
    LoadAllProducts event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductState.loading());

    final result = await _getAllProductUsecase(const NoParams());

    result.fold(
      (failure) => emit(ProductState.failure(failure.message)),
      (products) => emit(
        ProductState.loaded(products, searchQuery: '', allProducts: products),
      ),
    );
  }

  void _searchProducts(SearchProducts event, Emitter<ProductState> emit) {
    final currentState = state;

    if (currentState is Loaded) {
      final query = event.query.toLowerCase().trim();

      if (query.isEmpty) {
        // Показуємо всі продукти
        emit(
          ProductState.loaded(
            currentState.allProducts,
            searchQuery: '',
            allProducts: currentState.allProducts,
          ),
        );
      } else {
        final filteredProducts = currentState.allProducts.where((product) {
          return product.productName.toLowerCase().contains(query);
        }).toList();

        emit(
          ProductState.loaded(
            filteredProducts,
            searchQuery: query,
            allProducts: currentState.allProducts,
          ),
        );
      }
    }
  }

  Future<void> _toggleFavorite(
    ToggleFavorite event,
    Emitter<ProductState> emit,
  ) async {
    final currentState = state;

    if (currentState is Loaded) {
      // Optimistically update the UI
      final updatedProducts = currentState.products.map((product) {
        if (product.productId == event.productId) {
          return product.copyWith(isFavorite: !product.isFavorite);
        }
        return product;
      }).toList();

      emit(
        ProductState.loaded(
          updatedProducts,
          searchQuery: currentState.searchQuery,
        ),
      );

      // Call the usecase to persist the change
      final result = await _toggleFavoriteUsecase(event.productId);

      result.fold(
        (failure) {
          // Revert on failure
          emit(
            ProductState.loaded(
              currentState.products,
              searchQuery: currentState.searchQuery,
            ),
          );
          emit(ProductState.failure(failure.message));
        },
        (updatedProduct) {
          // Update with the actual result from the server
          final finalProducts = currentState.products.map((product) {
            if (product.productId == event.productId) {
              return updatedProduct;
            }
            return product;
          }).toList();
          emit(
            ProductState.loaded(
              finalProducts,
              searchQuery: currentState.searchQuery,
            ),
          );
        },
      );
    }
  }

  Future<void> _addToBasket(
    AddToBasket event,
    Emitter<ProductState> emit,
  ) async {
    final currentState = state;

    if (currentState is Loaded) {
      // Optimistically update the UI
      final updatedProducts = currentState.products.map((product) {
        if (product.productId == event.productId) {
          return product.copyWith(
            inCart: true,
            quantity: product.quantity + 1,
          );
        }
        return product;
      }).toList();

      emit(
        ProductState.loaded(
          updatedProducts,
          searchQuery: currentState.searchQuery,
        ),
      );

      // Call the usecase to persist the change
      final result = await _addToCartUsecase(
        AddToBasketParams(
          productId: event.productId,
          quantity: 1,
        ),
      );

      result.fold(
        (failure) {
          // Revert on failure
          emit(
            ProductState.loaded(
              currentState.products,
              searchQuery: currentState.searchQuery,
            ),
          );
          emit(ProductState.failure(failure.message));
        },
        (updatedProduct) {
          // Update with the actual result from the server
          final finalProducts = currentState.products.map((product) {
            if (product.productId == event.productId) {
              return updatedProduct;
            }
            return product;
          }).toList();
          emit(
            ProductState.loaded(
              finalProducts,
              searchQuery: currentState.searchQuery,
            ),
          );
        },
      );
    }
  }
}
