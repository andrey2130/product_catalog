import 'package:catalog_product/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:catalog_product/core/failure/app_failure.dart';

import 'package:catalog_product/feature/favorites/domain/repository/favorites_repository.dart';
import 'package:catalog_product/data/models/product_model.dart';

@injectable
class GetFavoriteProductsUsecase
    extends UseCase<Either<AppFailure, List<ProductModel>>, NoParams> {
  GetFavoriteProductsUsecase(this._repository);

  final FavoritesRepository _repository;

  @override
  Future<Either<AppFailure, List<ProductModel>>> call(NoParams params) {
    return _repository.getFavoriteProducts();
  }
}

