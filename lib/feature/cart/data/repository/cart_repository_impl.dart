import 'package:catalog_product/core/failure/app_failure.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/cart/data/datasource/cart_datasource.dart';
import 'package:catalog_product/feature/cart/domain/repository/cart_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartDatasource _cartDatasource;

  CartRepositoryImpl(this._cartDatasource);

  @override
  Future<Either<AppFailure, List<ProductModel>>> getCartProducts() async {
    try {
      final products = await _cartDatasource.getCartProducts();
      return Right(products);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, ProductModel>> addToCart(
    String productId, {
    int quantity = 1,
  }) async {
    try {
      final product = await _cartDatasource.addToCart(productId, quantity: quantity);
      return Right(product);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, ProductModel>> removeFromCart(String productId) async {
    try {
      final product = await _cartDatasource.removeFromCart(productId);
      return Right(product);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, ProductModel>> updateCartQuantity(
    String productId,
    int quantity,
  ) async {
    try {
      final product = await _cartDatasource.updateCartQuantity(productId, quantity);
      return Right(product);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, void>> clearCart() async {
    try {
      await _cartDatasource.clearCart();
      return Right(null);
    } catch (e) {
      return Left(AppFailure(message: e.toString()));
    }
  }
}
