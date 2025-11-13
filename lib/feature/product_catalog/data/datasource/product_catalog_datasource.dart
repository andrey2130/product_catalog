import 'dart:developer';

import 'package:catalog_product/core/storage/storage_service.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/data/mock_data/mock_products.dart';
import 'package:injectable/injectable.dart';

abstract class ProductCatalogDatasource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> toggleFavorite(String productId);
}

@Injectable(as: ProductCatalogDatasource)
class ProductCatalogDatasourceImpl implements ProductCatalogDatasource {
  final StorageService _storageService;

  ProductCatalogDatasourceImpl(this._storageService);
  
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final favorites = await _storageService.getFavoriteIds();
    final cartIds = await _storageService.getCartIds();
    final quantities = await _storageService.getCartQuantities();

    return mockProducts.map((product) {
      return product.copyWith(
        isFavorite: favorites.contains(product.productId),
        inCart: cartIds.contains(product.productId),
        quantity: quantities[product.productId] ??
            (cartIds.contains(product.productId) ? 1 : 0),
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

      
      await _storageService.toggleFavorite(productId);

      
      final favorites = await _storageService.getFavoriteIds();
      final cartIds = await _storageService.getCartIds();
      final quantities = await _storageService.getCartQuantities();

      final product = mockProducts[index];
      return product.copyWith(
        isFavorite: favorites.contains(productId),
        inCart: cartIds.contains(productId),
        quantity: quantities[productId] ?? (cartIds.contains(productId) ? 1 : 0),
      );
    } catch (e, stackTrace) {
      log(
        'Помилка оновлення статусу улюбленого товару $productId: ${e.toString()}',
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
