import 'dart:developer';

import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/product_catalog/data/datasource/product_catalog_datasource.dart';
import 'package:injectable/injectable.dart';

abstract class CartDatasource {
  Future<List<ProductModel>> getCartProduct();
}

@Injectable(as: CartDatasource)
class CartDatasourceImpl implements CartDatasource {
  final ProductCatalogDatasource _productCatalogDatasource;

  CartDatasourceImpl(this._productCatalogDatasource);

  @override
  Future<List<ProductModel>> getCartProduct() async {
    try {
      final allProducts = await _productCatalogDatasource.getAllProducts();
      final cartProducts = allProducts
          .where((product) => product.inCart)
          .toList();
      return cartProducts;
    } catch (e, st) {
      log("Помилка отримання продуктів у кошику: $e\n$st");
      return [];
    }
  }
}
