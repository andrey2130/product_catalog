import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_product/feature/product_catalog/presentation/bloc/product_bloc.dart';

class ProductSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String searchQuery;

  const ProductSearchField({
    super.key,
    required this.controller,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Пошук продуктів...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: searchQuery.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller.clear();
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
    );
  }
}

