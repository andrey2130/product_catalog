import 'package:catalog_product/core/widgets/product_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_product/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:catalog_product/feature/favorites/presentation/widgets/favorite_product_card.dart';
import 'package:catalog_product/core/widgets/empty_state_widget.dart';
import 'package:catalog_product/feature/product_catalog/presentation/widgets/custom_button.dart';


class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<FavoritesBloc>().add(const FavoritesEvent.loadFavoriteProducts());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              loaded: (products, searchQuery, allProducts) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      
                      title: const Text("Улюблені"),
                      centerTitle: true,
                      elevation: 0,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      floating: true,
                      pinned: true,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(70),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomSearchField(
                            controller: _searchController,
                            searchQuery: searchQuery,
                            onChanged: (value) {
                              context.read<FavoritesBloc>().add(
                                FavoritesEvent.searchProducts(value),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    if (products.isEmpty && searchQuery.isNotEmpty)
                      SliverFillRemaining(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 64,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Продуктів не знайдено',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else if (products.isEmpty)
                      SliverFillRemaining(
                        child: const EmptyStateWidget(
                          icon: Icons.favorite_border,
                          message: "Поки порожньо",
                        ),
                      )
                    else
                      SliverPadding(
                        padding: const EdgeInsets.all(16),
                        sliver: SliverList.separated(
                          itemCount: products.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            return FavoriteProductCard(product: products[index]);
                          },
                        ),
                      ),
                  ],
                );
              },
              failure: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(message, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 12),
                    CustomButton(
                      text: "Спробувати знову",
                      onPressed: () => context.read<FavoritesBloc>().add(
                            const FavoritesEvent.loadFavoriteProducts(),
                          ),
                    ),
                  ],
                ),
              ),
              orElse: () =>
                  const Center(child: CircularProgressIndicator.adaptive()),
            );
          },
        ),
      ),
    );
  }
}

