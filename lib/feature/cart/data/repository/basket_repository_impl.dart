import 'package:catalog_product/core/failure/app_failure.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/cart/data/datasource/basket_datasource.dart';
import 'package:catalog_product/feature/cart/domain/repository/basket_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BasketRepository)
class BasketRepositoryImpl implements BasketRepository {
  final BasketDatasource _basketDatasource;

  BasketRepositoryImpl(this._basketDatasource);

  @override
  Future<Either<AppFailure, List<ProductModel>>> getBasketProducts() async {
    try {
      final products = await _basketDatasource.getBasketProduct();
      return Right(products);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }
}
