import 'dart:developer';

import 'package:catalog_product/core/storage/storage_service.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/data/mock_data/mock_products.dart';
import 'package:injectable/injectable.dart';

abstract class ProductCatalogDatasource {
  Future<ProductModel> getProductById(String productId);
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> toggleFavorite(String productId);
  Future<ProductModel> addToBasket(String productId, {int quantity = 1});
  Future<ProductModel> removeFromBasket(String productId);
  Future<ProductModel> updateBasketQuantity(String productId, int quantity);
}

@Injectable(as: ProductCatalogDatasource)
class ProductCatalogDatasourceImpl implements ProductCatalogDatasource {
  final StorageService _storageService;

  ProductCatalogDatasourceImpl(this._storageService);

  @override
  Future<ProductModel> getProductById(String productId) async {
    try {
      final product = mockProducts.firstWhere(
        (p) => p.productId == productId,
        orElse: () {
          return ProductModel(
            productId: productId,
            productName: 'Невідомий товар',
            description: 'Опис відсутній.',
            imageUrl: 'https://example.com/sample-product.png',
            price: 0.0,
            isFavorite: false,
          );
        },
      );

      // Load saved states from SharedPreferences
      final favorites = await _storageService.getFavoriteIds();
      final basketIds = await _storageService.getBasketIds();
      final quantities = await _storageService.getBasketQuantities();

      return product.copyWith(
        isFavorite: favorites.contains(productId),
        inBasket: basketIds.contains(productId),
        quantity: quantities[productId] ?? (basketIds.contains(productId) ? 1 : 0),
      );
    } catch (e, stackTrace) {
      log(
        'Помилка завантаження товару $productId: ${e.toString()}',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final favorites = await _storageService.getFavoriteIds();
    final basketIds = await _storageService.getBasketIds();
    final quantities = await _storageService.getBasketQuantities();

    return mockProducts.map((product) {
      return product.copyWith(
        isFavorite: favorites.contains(product.productId),
        inBasket: basketIds.contains(product.productId),
        quantity: quantities[product.productId] ??
            (basketIds.contains(product.productId) ? 1 : 0),
      );
    }).toList();
  }

  @override
  Future<ProductModel> toggleFavorite(String productId) async {
    try {
      final index = mockProducts.indexWhere((p) => p.productId == productId);
      if (index == -1) {
        throw Exception('Product with id $productId not found');
      }

      // Save to SharedPreferences
      await _storageService.toggleFavorite(productId);

      // Get updated state
      final favorites = await _storageService.getFavoriteIds();
      final basketIds = await _storageService.getBasketIds();
      final quantities = await _storageService.getBasketQuantities();

      final product = mockProducts[index];
      return product.copyWith(
        isFavorite: favorites.contains(productId),
        inBasket: basketIds.contains(productId),
        quantity: quantities[productId] ?? (basketIds.contains(productId) ? 1 : 0),
      );
    } catch (e, stackTrace) {
      log(
        'Помилка оновлення статусу улюбленого товару $productId: ${e.toString()}',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  @override
  Future<ProductModel> addToBasket(String productId, {int quantity = 1}) async {
    try {
      final index = mockProducts.indexWhere((p) => p.productId == productId);
      if (index == -1) {
        throw Exception('Product with id $productId not found');
      }

      // Save to SharedPreferences
      await _storageService.addToBasket(productId, quantity: quantity);

      // Get updated state
      final favorites = await _storageService.getFavoriteIds();
      final basketIds = await _storageService.getBasketIds();
      final quantities = await _storageService.getBasketQuantities();

      final product = mockProducts[index];
      return product.copyWith(
        isFavorite: favorites.contains(productId),
        inBasket: basketIds.contains(productId),
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
  Future<ProductModel> removeFromBasket(String productId) async {
    try {
      final index = mockProducts.indexWhere((p) => p.productId == productId);
      if (index == -1) {
        throw Exception('Product with id $productId not found');
      }

      // Save to SharedPreferences
      await _storageService.removeFromBasket(productId);

      // Get updated state
      final favorites = await _storageService.getFavoriteIds();
      final basketIds = await _storageService.getBasketIds();
      final quantities = await _storageService.getBasketQuantities();

      final product = mockProducts[index];
      return product.copyWith(
        isFavorite: favorites.contains(productId),
        inBasket: basketIds.contains(productId),
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
  Future<ProductModel> updateBasketQuantity(String productId, int quantity) async {
    try {
      final index = mockProducts.indexWhere((p) => p.productId == productId);
      if (index == -1) {
        throw Exception('Product with id $productId not found');
      }

      // Save to SharedPreferences
      await _storageService.updateBasketQuantity(productId, quantity);

      // Get updated state
      final favorites = await _storageService.getFavoriteIds();
      final basketIds = await _storageService.getBasketIds();
      final quantities = await _storageService.getBasketQuantities();

      final product = mockProducts[index];
      return product.copyWith(
        isFavorite: favorites.contains(productId),
        inBasket: basketIds.contains(productId),
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
}
