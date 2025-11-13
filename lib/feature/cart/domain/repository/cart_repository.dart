import 'package:catalog_product/data/models/product_model.dart';
import 'package:dartz/dartz.dart';
import 'package:catalog_product/core/failure/app_failure.dart';


abstract class CartRepository {
  Future<Either<AppFailure, List<ProductModel>>> getCartProducts();
  Future<Either<AppFailure, ProductModel>> addToCart(String productId, {int quantity = 1});
  Future<Either<AppFailure, ProductModel>> removeFromCart(String productId);
  Future<Either<AppFailure, ProductModel>> updateCartQuantity(String productId, int quantity);
  Future<Either<AppFailure, void>> clearCart();
}
