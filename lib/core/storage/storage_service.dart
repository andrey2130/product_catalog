import 'dart:convert';
import 'package:catalog_product/core/theme/cubit/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class StorageService {
  static const String _favoritesKey = 'favorites';
  static const String _cartKey = 'cart';
  static const String _cartQuantitiesKey = 'cart_quantities';
  static const String _themeModeKey = 'theme_mode';

  Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  // Favorites
  Future<Set<String>> getFavoriteIds() async {
    final prefs = await _prefs;
    final favoritesJson = prefs.getString(_favoritesKey);
    if (favoritesJson == null) return {};
    try {
      final List<dynamic> favoritesList = json.decode(favoritesJson);
      return favoritesList.map((e) => e.toString()).toSet();
    } catch (e) {
      return {};
    }
  }

  Future<void> saveFavoriteIds(Set<String> favoriteIds) async {
    final prefs = await _prefs;
    await prefs.setString(_favoritesKey, json.encode(favoriteIds.toList()));
  }

  Future<void> toggleFavorite(String productId) async {
    final favorites = await getFavoriteIds();
    if (favorites.contains(productId)) {
      favorites.remove(productId);
    } else {
      favorites.add(productId);
    }
    await saveFavoriteIds(favorites);
  }

  // Cart
  Future<Set<String>> getCartIds() async {
    final prefs = await _prefs;
    final cartJson = prefs.getString(_cartKey);
    if (cartJson == null) return {};
    try {
      final List<dynamic> cartList = json.decode(cartJson);
      return cartList.map((e) => e.toString()).toSet();
    } catch (e) {
      return {};
    }
  }

  Future<void> saveCartIds(Set<String> cartIds) async {
    final prefs = await _prefs;
    await prefs.setString(_cartKey, json.encode(cartIds.toList()));
  }

  Future<Map<String, int>> getCartQuantities() async {
    final prefs = await _prefs;
    final quantitiesJson = prefs.getString(_cartQuantitiesKey);
    if (quantitiesJson == null) return {};
    try {
      final Map<String, dynamic> quantitiesMap =
          json.decode(quantitiesJson) as Map<String, dynamic>;
      return quantitiesMap.map((key, value) => MapEntry(key, value as int));
    } catch (e) {
      return {};
    }
  }

  Future<void> saveCartQuantities(Map<String, int> quantities) async {
    final prefs = await _prefs;
    await prefs.setString(
      _cartQuantitiesKey,
      json.encode(quantities),
    );
  }

  Future<void> addToCart(String productId, {int quantity = 1}) async {
    final cartIds = await getCartIds();
    cartIds.add(productId);
    await saveCartIds(cartIds);

    final quantities = await getCartQuantities();
    quantities[productId] = (quantities[productId] ?? 0) + quantity;
    await saveCartQuantities(quantities);
  }

  Future<void> removeFromCart(String productId) async {
    final cartIds = await getCartIds();
    cartIds.remove(productId);
    await saveCartIds(cartIds);

    final quantities = await getCartQuantities();
    quantities.remove(productId);
    await saveCartQuantities(quantities);
  }

  Future<void> updateCartQuantity(String productId, int quantity) async {
    if (quantity <= 0) {
      await removeFromCart(productId);
      return;
    }

    final cartIds = await getCartIds();
    if (!cartIds.contains(productId)) {
      cartIds.add(productId);
      await saveCartIds(cartIds);
    }

    final quantities = await getCartQuantities();
    quantities[productId] = quantity;
    await saveCartQuantities(quantities);
  }


  // Theme
  Future<void> setThemeMode(ThemeState themeMode) async {
    final prefs = await _prefs;
    await prefs.setString(
      _themeModeKey,
      themeMode.when(light: () => 'light', dark: () => 'dark'),
    );
  }

  Future<ThemeState> getThemeMode() async {
    final prefs = await _prefs;
    final themeString = prefs.getString(_themeModeKey) ?? 'light';
    return themeString == 'dark'
        ? const ThemeState.dark()
        : const ThemeState.light();
  }
}

