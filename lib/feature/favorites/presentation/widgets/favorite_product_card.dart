import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_product/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/core/widgets/product_image_widget.dart';
import 'package:catalog_product/core/widgets/product_info_section.dart';
import 'package:catalog_product/core/widgets/circular_action_button.dart';
import 'package:go_router/go_router.dart';

class FavoriteProductCard extends StatelessWidget {
  final ProductModel product;

  const FavoriteProductCard({required this.product, super.key});

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
              CircularActionButton(
                icon: Icons.favorite,
                onTap: () => context.read<FavoritesBloc>().add(
                      FavoritesEvent.removeFavorite(product.productId),
                    ),
                backgroundColor: Colors.red,
                iconColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

