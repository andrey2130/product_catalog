import 'package:catalog_product/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:catalog_product/core/failure/app_failure.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/cart/domain/repository/cart_repository.dart';

@injectable
class AddToCartUsecase
    extends UseCase<Either<AppFailure, ProductModel>, AddToCartParams> {
  AddToCartUsecase(this._repository);

  final CartRepository _repository;

  @override
  Future<Either<AppFailure, ProductModel>> call(AddToCartParams params) {
    return _repository.addToCart(
      params.productId,
      quantity: params.quantity,
    );
  }
}

class AddToCartParams {
  final String productId;
  final int quantity;

  AddToCartParams({
    required this.productId,
    this.quantity = 1,
  });
}
