import 'package:catalog_product/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:catalog_product/feature/product_catalog/presentation/widgets/custom_button.dart';
import 'package:catalog_product/feature/product_catalog/presentation/bloc/product_bloc.dart';

class ProductCatalogPage extends StatefulWidget {
  const ProductCatalogPage({super.key});

  @override
  State<ProductCatalogPage> createState() => _ProductCatalogPageState();
}

class _ProductCatalogPageState extends State<ProductCatalogPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(ProductEvent.loadAllProducts());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push("/basket"),
        child: Icon(Icons.shopping_basket),
      ),
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (BuildContext context, ProductState state) {
            return state.maybeWhen(
              loading: () =>
                  Center(child: CircularProgressIndicator.adaptive()),

              loaded: (products, searchQuery, allProducts) {
                return CustomScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

                  slivers: [
                    SliverAppBar(
                      leading: IconButton(onPressed: () => context.push("/browser"), icon: Icon(Icons.public)),
                      title: Text("Каталог продуктів"),
                      actions: [
                         
                        IconButton(
                          onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                          icon: Icon(context.read<ThemeCubit>().state.when(
                            light: () => Icons.dark_mode,
                            dark: () => Icons.light_mode,
                          )),
                        ),
                        IconButton(
                          onPressed: () => context.push("/favorites"),
                          icon: Icon(Icons.favorite_border),
                        ),
                       
                      ],
                      floating: true,
                      pinned: true,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(70),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Пошук продуктів...',
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: searchQuery.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () {
                                        _searchController.clear();
                                        context.read<ProductBloc>().add(
                                          ProductEvent.searchProducts(''),
                                        );
                                      },
                                    )
                                  : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Theme.of(context).cardColor,
                            ),
                            onChanged: (value) {
                              context.read<ProductBloc>().add(
                                ProductEvent.searchProducts(value),
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
                    else
                      SliverList.separated(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
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
                        },
                        separatorBuilder: (context, index) =>
                            Divider(height: 1),
                      ),
                  ],
                );
              },

              failure: (message) => Center(
                child: Column(
                  children: [
                    Text(message),
                    CustomButton(
                      text: "Повіторіть заново",
                      onPressed: () => context.read()<ProductBloc>().add(
                        ProductEvent.loadAllProducts(),
                      ),
                    ),
                  ],
                ),
              ),
              orElse: () => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator.adaptive(),
                    Text('Очікування даних...'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
