import 'dart:developer';

import 'package:catalog_product/core/storage/storage_service.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/data/mock_data/mock_products.dart';
import 'package:injectable/injectable.dart';

abstract class CartDatasource {
  Future<List<ProductModel>> getCartProducts();
  Future<ProductModel> addToCart(String productId, {int quantity = 1});
  Future<ProductModel> removeFromCart(String productId);
  Future<ProductModel> updateCartQuantity(String productId, int quantity);
  Future<void> clearCart();
}

@Injectable(as: CartDatasource)
class CartDatasourceImpl implements CartDatasource {
  final StorageService _storageService;

  CartDatasourceImpl(this._storageService);

  @override
  Future<List<ProductModel>> getCartProducts() async {
    try {
      final basketIds = await _storageService.getCartIds();
      final quantities = await _storageService.getCartQuantities();
      final favorites = await _storageService.getFavoriteIds();

      return mockProducts
          .where((product) => basketIds.contains(product.productId))
          .map((product) {
        return product.copyWith(
          isFavorite: favorites.contains(product.productId),
          inCart: true,
          quantity: quantities[product.productId] ?? 1,
        );
      }).toList();
    } catch (e, st) {
      log("Помилка отримання продуктів у кошику: $e\n$st");
      return [];
    }
  }

  @override
  Future<ProductModel> addToCart(String productId, {int quantity = 1}) async {
    try {
      final index = mockProducts.indexWhere((p) => p.productId == productId);
      if (index == -1) {
        throw Exception('Product with id $productId not found');
      }

      await _storageService.addToCart(productId, quantity: quantity);

      final favorites = await _storageService.getFavoriteIds();
      final basketIds = await _storageService.getCartIds();
      final quantities = await _storageService.getCartQuantities();

      final product = mockProducts[index];
      return product.copyWith(
        isFavorite: favorites.contains(productId),
        inCart: basketIds.contains(productId),
        quantity: quantities[productId] ?? quantity,
      );
    } catch (e, stackTrace) {
      log(
        'Помилка додавання товару до кошика $productId: ${e.toString()}',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<ProductModel> removeFromCart(String productId) async {
    try {
      final index = mockProducts.indexWhere((p) => p.productId == productId);
      if (index == -1) {
        throw Exception('Product with id $productId not found');
      }

      await _storageService.removeFromCart(productId);

      final favorites = await _storageService.getFavoriteIds();
      final basketIds = await _storageService.getCartIds();
      final quantities = await _storageService.getCartQuantities();

      final product = mockProducts[index];
      return product.copyWith(
        isFavorite: favorites.contains(productId),
        inCart: basketIds.contains(productId),
        quantity: quantities[productId] ?? 0,
      );
    } catch (e, stackTrace) {
      log(
        'Помилка видалення товару з кошика $productId: ${e.toString()}',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<ProductModel> updateCartQuantity(String productId, int quantity) async {
    try {
      final index = mockProducts.indexWhere((p) => p.productId == productId);
      if (index == -1) {
        throw Exception('Product with id $productId not found');
      }


      await _storageService.updateCartQuantity(productId, quantity);


      final favorites = await _storageService.getFavoriteIds();
      final basketIds = await _storageService.getCartIds();
      final quantities = await _storageService.getCartQuantities();

      final product = mockProducts[index];
      return product.copyWith(
        isFavorite: favorites.contains(productId),
        inCart: basketIds.contains(productId),
        quantity: quantities[productId] ?? 0,
      );
    } catch (e, stackTrace) {
      log(
        'Помилка оновлення кількості товару в кошику $productId: ${e.toString()}',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      await _storageService.clearCart();
    } catch (e, st) {
      log("Помилка очищення кошику: $e\n$st");
      rethrow;
    }
  }
}
