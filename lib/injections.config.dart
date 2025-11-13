// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/storage/storage_service.dart' as _i263;
import 'core/theme/cubit/theme_cubit.dart' as _i577;
import 'core/usecases/search_products_usecase.dart' as _i441;
import 'feature/cart/data/datasource/cart_datasource.dart' as _i591;
import 'feature/cart/data/repository/cart_repository_impl.dart' as _i122;
import 'feature/cart/domain/repository/cart_repository.dart' as _i350;
import 'feature/cart/domain/usecases/add_to_cart_usecase.dart' as _i601;
import 'feature/cart/domain/usecases/remove_from_cart_usecase.dart' as _i123;
import 'feature/cart/domain/usecases/update_cart_quantity_usecase.dart'
    as _i661;
import 'feature/cart/presentation/bloc/cart_bloc.dart' as _i796;
import 'feature/favorites/data/datasource/favorites_datasource.dart' as _i802;
import 'feature/favorites/data/repository/favorites_repository_impl.dart'
    as _i470;
import 'feature/favorites/domain/repository/favorites_repository.dart' as _i682;
import 'feature/favorites/domain/usecases/get_favorite_products_usecase.dart'
    as _i199;
import 'feature/favorites/presentation/bloc/favorites_bloc.dart' as _i502;
import 'feature/product_catalog/data/datasource/product_catalog_datasource.dart'
    as _i513;
import 'feature/product_catalog/data/repository/product_catalog_repository_impl.dart'
    as _i52;
import 'feature/product_catalog/domain/repository/product_catalog_repository.dart'
    as _i227;
import 'feature/product_catalog/domain/usecase/get_all_product_usecase.dart'
    as _i51;
import 'feature/product_catalog/domain/usecase/toggle_favorite_usecase.dart'
    as _i638;
import 'feature/product_catalog/presentation/bloc/product_bloc.dart' as _i281;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i263.StorageService>(() => _i263.StorageService());
    gh.factory<_i441.SearchProductsUsecase>(
      () => _i441.SearchProductsUsecase(),
    );
    gh.factory<_i513.ProductCatalogDatasource>(
      () => _i513.ProductCatalogDatasourceImpl(gh<_i263.StorageService>()),
    );
    gh.lazySingleton<_i577.ThemeCubit>(
      () => _i577.ThemeCubit(gh<_i263.StorageService>()),
    );
    gh.factory<_i591.CartDatasource>(
      () => _i591.CartDatasourceImpl(gh<_i513.ProductCatalogDatasource>()),
    );
    gh.factory<_i227.ProductCatalogRepository>(
      () => _i52.ProductCatalogRepositoryImpl(
        gh<_i513.ProductCatalogDatasource>(),
      ),
    );
    gh.factory<_i802.FavoritesDatasource>(
      () => _i802.FavoritesDatasourceImpl(gh<_i513.ProductCatalogDatasource>()),
    );
    gh.factory<_i601.AddToCartUsecase>(
      () => _i601.AddToCartUsecase(gh<_i227.ProductCatalogRepository>()),
    );
    gh.factory<_i123.RemoveFromCartUsecase>(
      () => _i123.RemoveFromCartUsecase(gh<_i227.ProductCatalogRepository>()),
    );
    gh.factory<_i661.UpdateCartQuantityUsecase>(
      () =>
          _i661.UpdateCartQuantityUsecase(gh<_i227.ProductCatalogRepository>()),
    );
    gh.factory<_i51.GetAllProductUsecase>(
      () => _i51.GetAllProductUsecase(gh<_i227.ProductCatalogRepository>()),
    );
    gh.factory<_i638.ToggleFavoriteUsecase>(
      () => _i638.ToggleFavoriteUsecase(gh<_i227.ProductCatalogRepository>()),
    );
    gh.factory<_i350.CartRepository>(
      () => _i122.CartRepositoryImpl(gh<_i591.CartDatasource>()),
    );
    gh.factory<_i281.ProductBloc>(
      () => _i281.ProductBloc(
        gh<_i51.GetAllProductUsecase>(),
        gh<_i638.ToggleFavoriteUsecase>(),
        gh<_i601.AddToCartUsecase>(),
        gh<_i441.SearchProductsUsecase>(),
      ),
    );
    gh.factory<_i682.FavoritesRepository>(
      () => _i470.FavoritesRepositoryImpl(gh<_i802.FavoritesDatasource>()),
    );
    gh.factory<_i199.GetFavoriteProductsUsecase>(
      () => _i199.GetFavoriteProductsUsecase(gh<_i682.FavoritesRepository>()),
    );
    gh.factory<_i796.CartBloc>(
      () => _i796.CartBloc(
        gh<_i350.CartRepository>(),
        gh<_i123.RemoveFromCartUsecase>(),
        gh<_i661.UpdateCartQuantityUsecase>(),
      ),
    );
    gh.factory<_i502.FavoritesBloc>(
      () => _i502.FavoritesBloc(
        gh<_i199.GetFavoriteProductsUsecase>(),
        gh<_i638.ToggleFavoriteUsecase>(),
        gh<_i441.SearchProductsUsecase>(),
      ),
    );
    return this;
  }
}
