import 'package:catalog_product/core/failure/app_failure.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/product_catalog/data/datasource/product_catalog_datasource.dart';
import 'package:catalog_product/feature/product_catalog/domain/repository/product_catalog_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: ProductCatalogRepository)
class ProductCatalogRepositoryImpl implements ProductCatalogRepository {
  final ProductCatalogDatasource _datasource;

  ProductCatalogRepositoryImpl(this._datasource);

  @override
  Future<Either<AppFailure, ProductModel>> getProductById(
    String productId,
  ) async {
    try {
      final product = await _datasource.getProductById(productId);
      return Right(product);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, List<ProductModel>>> getAllProducts() async {
    try {
      final products = await _datasource.getAllProducts();
      return Right(products);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, ProductModel>> toggleFavorite(
    String productId,
  ) async {
    try {
      final product = await _datasource.toggleFavorite(productId);
      return Right(product);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }
}
