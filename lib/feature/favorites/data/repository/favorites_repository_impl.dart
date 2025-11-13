import 'package:catalog_product/core/failure/app_failure.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/favorites/data/datasource/favorites_datasource.dart';
import 'package:catalog_product/feature/favorites/domain/repository/favorites_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoritesRepository)
class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesDatasource _favoritesDatasource;

  FavoritesRepositoryImpl(this._favoritesDatasource);

  @override
  Future<Either<AppFailure, List<ProductModel>>> getFavoriteProducts() async {
    try {
      final products = await _favoritesDatasource.getFavoriteProducts();
      return Right(products);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }
}

