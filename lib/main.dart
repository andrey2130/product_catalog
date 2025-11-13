import 'package:catalog_product/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catalog_product/core/app_route/app_route.dart';
import 'package:catalog_product/core/theme/app_theme.dart';
import 'package:catalog_product/feature/cart/presentation/bloc/cart_bloc.dart';
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
        BlocProvider(create: (context) => getIt<CartBloc>()),
        BlocProvider(create: (context) => getIt<FavoritesBloc>()),
        BlocProvider(create: (context) => getIt<ThemeCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          final themeMode = themeState.when(
            light: () => ThemeMode.light,
            dark: () => ThemeMode.dark,
            system: () => ThemeMode.system,
          );
          
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            behavior: HitTestBehavior.opaque,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: AppThemes.lightTheme(),
              darkTheme: AppThemes.darkTheme(),
              themeMode: themeMode,
              routerConfig: appRoutes,
            ),
          );
        },
      ),
    );
  }
}
