import 'package:catalog_product/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:catalog_product/core/failure/app_failure.dart';

import 'package:catalog_product/feature/cart/domain/repository/basket_repository.dart';
import 'package:catalog_product/data/models/product_model.dart';

@injectable
class GetBascketProductsUsecase
    extends UseCase<Either<AppFailure, List<ProductModel>>, NoParams> {
  GetBascketProductsUsecase(this._repository);

  final BasketRepository _repository;

  @override
  Future<Either<AppFailure, List<ProductModel>>> call(NoParams params) {
    return _repository.getBasketProducts();
  }
}
