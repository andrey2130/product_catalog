import 'package:catalog_product/feature/cart/presentation/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_product/feature/cart/presentation/bloc/cart_bloc.dart';
import 'package:catalog_product/core/widgets/empty_state_widget.dart';
import 'package:catalog_product/feature/product_catalog/presentation/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(const CartEvent.loadCartProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text("Кошик"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          IconButton(
            onPressed: () =>  showDialog(context: context, builder: (context) => AlertDialog.adaptive(
              title: Text("Ви впевнені, що хочете очистити кошик?"),
              actions: [
                TextButton(onPressed: () => context.pop(), child: Text("Ні")),
                TextButton(onPressed: () {
                  context.read<CartBloc>().add(const CartEvent.clearCart());
                  context.pop();
                }, child: Text("Так")),
              ],
            )),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              loaded: (products, total) {
                if (products.isEmpty) {
                  return const EmptyStateWidget(
                    icon: Icons.shopping_bag_outlined,
                    message: "Кошик порожній",
                  );
                }

                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemCount: products.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          return CartProductCard(product: products[index]);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Сума: ₴${total.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
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
                      onPressed: () => context.read<CartBloc>().add(
                        const CartEvent.loadCartProducts(),
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
