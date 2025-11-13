import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/product_catalog/presentation/bloc/product_bloc.dart' as product_bloc;
import 'package:catalog_product/feature/product_catalog/presentation/widgets/custom_button.dart';
import 'package:catalog_product/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocListener<product_bloc.ProductBloc, product_bloc.ProductState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (products, searchQuery, allProducts) {
            final updatedProduct = products.firstWhere(
              (p) => p.productId == product.productId,
              orElse: () => product,
            );
            if (updatedProduct.inCart != product.inCart && updatedProduct.inCart) {
              context.read<CartBloc>().add(const CartEvent.loadCartProducts());
            }
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<product_bloc.ProductBloc, product_bloc.ProductState>(
        builder: (context, state) {
          ProductModel currentProduct = product;
          state.maybeWhen(
            loaded: (products, searchQuery, allProducts) {
              final updatedProduct = products.firstWhere(
                (p) => p.productId == product.productId,
                orElse: () => product,
              );
              currentProduct = updatedProduct;
            },
            orElse: () {},
          );

          return Scaffold(
          body: SafeArea(
            top: false,
            child: CustomScrollView(
              slivers: [
                _buildAppBar(context, currentProduct),
                _buildContent(context, currentProduct),
                _buildAddToCartButton(context, currentProduct),
                const SliverToBoxAdapter(child: SizedBox(height: 32)),
              ],
            ),
          ),
        );
        },
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context, ProductModel product) {
    final colorScheme = Theme.of(context).colorScheme;

    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: colorScheme.surface,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.3),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: colorScheme.surface,
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                fit: BoxFit.contain,
                width: double.infinity,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      colorScheme.primary,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: colorScheme.surface,
                  child: Icon(
                    Icons.broken_image,
                    size: 80,
                    color: colorScheme.onSurface.withValues(alpha: 0.3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildContent(BuildContext context, ProductModel product) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product name and favorite
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    product.productName,
                    style: textTheme.displayLarge?.copyWith(
                      fontSize: 26,
                      height: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      context.read<product_bloc.ProductBloc>().add(
                            product_bloc.ProductEvent.toggleFavorite(product.productId),
                          );
                    },
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFavorite
                          ? colorScheme.error
                          : colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Description card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.description_outlined,
                        size: 20,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Опис",
                        style: textTheme.labelLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    product.description,
                    style: textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                      color: colorScheme.onSurface.withValues(alpha: 0.8),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Price card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.12),
                    colorScheme.primary.withValues(alpha: 0.06),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colorScheme.primary.withValues(alpha: 0.25),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ціна",
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "₴${product.price.toStringAsFixed(2)}",
                        style: textTheme.displayLarge?.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildAddToCartButton(
    BuildContext context,
    ProductModel product,
  ) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomButton(
          text: product.inCart ? "Вже в кошику" : "До кошика",
          onPressed: product.inCart
              ? () {}
              : () {
                  context.read<product_bloc.ProductBloc>().add(
                        product_bloc.ProductEvent.addToBasket(product.productId),
                      );
                },
        ),
      ),
    );
  }
}