import 'package:catalog_product/data/models/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:catalog_product/core/failure/app_failure.dart';


abstract class ProductCatalogRepository {
  Future<Either<AppFailure, List<ProductModel>>> getAllProducts();
  Future<Either<AppFailure, ProductModel>> toggleFavorite(String productId);
}
