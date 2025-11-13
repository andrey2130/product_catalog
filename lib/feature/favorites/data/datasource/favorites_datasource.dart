import 'dart:developer';

import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/product_catalog/data/datasource/product_catalog_datasource.dart';
import 'package:injectable/injectable.dart';

abstract class FavoritesDatasource {
  Future<List<ProductModel>> getFavoriteProducts();
}

@Injectable(as: FavoritesDatasource)
class FavoritesDatasourceImpl implements FavoritesDatasource {
  final ProductCatalogDatasource _productCatalogDatasource;

  FavoritesDatasourceImpl(this._productCatalogDatasource);

  @override
  Future<List<ProductModel>> getFavoriteProducts() async {
    try {
      final allProducts = await _productCatalogDatasource.getAllProducts();
      final favoriteProducts = allProducts
          .where((product) => product.isFavorite)
          .toList();
      return favoriteProducts;
    } catch (e, st) {
      log("Помилка отримання улюблених продуктів: $e\n$st");
      return [];
    }
  }
}

