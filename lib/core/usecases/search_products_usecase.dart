import 'package:catalog_product/data/models/product_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchProductsUsecase {
  List<ProductModel> call({
    required List<ProductModel> products,
    required String query,
  }) {
    if (query.trim().isEmpty) {
      return products;
    }

    final lowerQuery = query.toLowerCase().trim();
    return products.where((product) {
      return product.productName.toLowerCase().contains(lowerQuery);
    }).toList();
  }
}

