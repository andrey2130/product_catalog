import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/core/failure/app_failure.dart';
import 'package:dartz/dartz.dart';

abstract class FavoritesRepository {
  Future<Either<AppFailure, List<ProductModel>>> getFavoriteProducts();
}

