import 'package:catalog_product/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:catalog_product/core/failure/app_failure.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/product_catalog/domain/repository/product_catalog_repository.dart';

@injectable
class UpdateCartQuantityUsecase
    extends UseCase<Either<AppFailure, ProductModel>, UpdateCartQuantityParams> {
  UpdateCartQuantityUsecase(this._repository);

  final ProductCatalogRepository _repository;

  @override
  Future<Either<AppFailure, ProductModel>> call(UpdateCartQuantityParams params) {
    return _repository.updateBasketQuantity(params.productId, params.quantity);
  }
}

class UpdateCartQuantityParams {
  final String productId;
  final int quantity;

  UpdateCartQuantityParams({
    required this.productId,
    required this.quantity,
  });
}

