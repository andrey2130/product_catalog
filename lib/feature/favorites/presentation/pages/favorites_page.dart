import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_product/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:catalog_product/feature/favorites/presentation/widgets/favorite_product_card.dart';
import 'package:catalog_product/feature/product_catalog/presentation/widgets/custom_button.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesBloc>().add(const FavoritesEvent.loadFavoriteProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Улюблені"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SafeArea(
        child: BlocBuilder<FavoritesBloc, FavoritesState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              loaded: (products) {
                if (products.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Список улюблених порожній",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: products.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return FavoriteProductCard(product: products[index]);
                  },
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

