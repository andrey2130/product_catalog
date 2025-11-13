import 'dart:developer';

import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/product_catalog/data/datasource/product_catalog_datasource.dart';
import 'package:injectable/injectable.dart';

abstract class BasketDatasource {
  Future<List<ProductModel>> getBasketProduct();
}

@Injectable(as: BasketDatasource)
class BasketDatasourceImpl implements BasketDatasource {
  final ProductCatalogDatasource _productCatalogDatasource;

  BasketDatasourceImpl(this._productCatalogDatasource);

  @override
  Future<List<ProductModel>> getBasketProduct() async {
    try {
      final allProducts = await _productCatalogDatasource.getAllProducts();
      final basketProducts = allProducts
          .where((product) => product.inBasket)
          .toList();
      return basketProducts;
    } catch (e, st) {
      log("Помилка отримання продуктів у кошику: $e\n$st");
      return [];
    }
  }
}
