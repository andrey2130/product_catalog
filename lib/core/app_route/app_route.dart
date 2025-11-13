import 'package:catalog_product/data/models/product_model.dart';
import 'package:catalog_product/feature/browser/presentation/pages/mini_browser.dart';
import 'package:catalog_product/feature/cart/presentation/pages/cart_page.dart';
import 'package:catalog_product/feature/favorites/presentation/pages/favorites_page.dart';
import 'package:catalog_product/feature/product_catalog/presentation/pages/product_catalog_page.dart';
import 'package:catalog_product/feature/product_catalog/presentation/pages/product_details_page.dart';
import 'package:catalog_product/feature/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRoutes = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => ProductCatalogPage()),
    GoRoute(
      path: "/product_details",
      builder: (context, state) {
        final product = state.extra;
        if (product == null || product is! ProductModel) {
          return Scaffold(
            appBar: AppBar(title: const Text('Помилка')),
            body: const Center(child: Text('Продукт не знайдено')),
          );
        }
        return ProductDetailsPage(product: product);
      },
    ),
    GoRoute(path: "/basket", builder: (context, state) => CartPage()),
    GoRoute(path: "/favorites", builder: (context, state) => const FavoritesPage()),
    GoRoute(path: "/browser", builder: (context, state) => const MiniBrowser()),
    GoRoute(path: "/settings", builder: (context, state) => const SettingsPage()),
  ],
);
