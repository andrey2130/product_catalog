import 'package:catalog_product/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:catalog_product/core/failure/app_failure.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/cart/domain/repository/cart_repository.dart';

@injectable
class UpdateCartQuantityUsecase
    extends UseCase<Either<AppFailure, ProductModel>, UpdateCartQuantityParams> {
  UpdateCartQuantityUsecase(this._repository);

  final CartRepository _repository;

  @override
  Future<Either<AppFailure, ProductModel>> call(UpdateCartQuantityParams params) {
    return _repository.updateCartQuantity(params.productId, params.quantity);
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
