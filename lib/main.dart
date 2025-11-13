import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_product/core/app_route/app_route.dart';
import 'package:catalog_product/core/theme/app_theme.dart';
import 'package:catalog_product/feature/cart/presentation/bloc/basket_bloc.dart';
import 'package:catalog_product/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:catalog_product/feature/product_catalog/presentation/bloc/product_bloc.dart';
import 'package:catalog_product/injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProductBloc>()),
        BlocProvider(create: (context) => getIt<BasketBloc>()),
        BlocProvider(create: (context) => getIt<FavoritesBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme(),
        routerConfig: appRoutes,
      ),
    );
  }
}
