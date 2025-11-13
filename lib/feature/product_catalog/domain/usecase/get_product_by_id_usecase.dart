import 'package:catalog_product/core/failure/app_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:catalog_product/core/usecases/usecase.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/product_catalog/domain/repository/product_catalog_repository.dart';

@injectable
class GetProductByIdUsecase
    extends UseCase<Either<AppFailure, ProductModel>, String> {
  GetProductByIdUsecase(this._repository);

  final ProductCatalogRepository _repository;

  @override
  Future<Either<AppFailure, ProductModel>> call(String productId) {
    return _repository.getProductById(productId);
  }
}