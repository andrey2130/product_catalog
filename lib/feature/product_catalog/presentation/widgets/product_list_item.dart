import 'package:catalog_product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductListItem extends StatelessWidget {
  final ProductModel product;

  const ProductListItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.productName),
      subtitle: Text(product.description),
      trailing: Text(
        "₴${product.price.toStringAsFixed(2)}",
      ),
      onTap: () => context.push(
        "/product_details",
        extra: product,
      ),
    );
  }
}

