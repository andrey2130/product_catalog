import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_product/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:catalog_product/feature/cart/presentation/widgets/cart_quantity_button.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/core/widgets/product_image_widget.dart';
import 'package:catalog_product/core/widgets/product_info_section.dart';
import 'package:catalog_product/core/widgets/circular_action_button.dart';
import 'package:go_router/go_router.dart';

class CartProductCard extends StatelessWidget {
  final ProductModel product;

  const CartProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/product_details", extra: product),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageWidget(imageUrl: product.imageUrl),
              const SizedBox(width: 16),
              Expanded(
                child: ProductInfoSection(
                  productName: product.productName,
                  description: product.description,
                  price: product.price,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircularActionButton(
                    icon: Icons.delete_outline,
                    onTap: () => context.read<CartBloc>().add(
                      CartEvent.removeProduct(product.productId),
                    ),
                    backgroundColor: Colors.red,
                    iconColor: Colors.red,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CartQuantityButton(
                        icon: Icons.remove,
                        onTap: () => context.read<CartBloc>().add(
                          CartEvent.decreaseQuantity(product.productId),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '${product.quantity}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      CartQuantityButton(
                        icon: Icons.add,
                        onTap: () => context.read<CartBloc>().add(
                          CartEvent.increaseQuantity(product.productId),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
