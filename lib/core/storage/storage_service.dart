import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class StorageService {
  static const String _favoritesKey = 'favorites';
  static const String _basketKey = 'basket';
  static const String _basketQuantitiesKey = 'basket_quantities';

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

  // Basket
  Future<Set<String>> getBasketIds() async {
    final prefs = await _prefs;
    final basketJson = prefs.getString(_basketKey);
    if (basketJson == null) return {};
    try {
      final List<dynamic> basketList = json.decode(basketJson);
      return basketList.map((e) => e.toString()).toSet();
    } catch (e) {
      return {};
    }
  }

  Future<void> saveBasketIds(Set<String> basketIds) async {
    final prefs = await _prefs;
    await prefs.setString(_basketKey, json.encode(basketIds.toList()));
  }

  Future<Map<String, int>> getBasketQuantities() async {
    final prefs = await _prefs;
    final quantitiesJson = prefs.getString(_basketQuantitiesKey);
    if (quantitiesJson == null) return {};
    try {
      final Map<String, dynamic> quantitiesMap =
          json.decode(quantitiesJson) as Map<String, dynamic>;
      return quantitiesMap.map((key, value) => MapEntry(key, value as int));
    } catch (e) {
      return {};
    }
  }

  Future<void> saveBasketQuantities(Map<String, int> quantities) async {
    final prefs = await _prefs;
    await prefs.setString(
      _basketQuantitiesKey,
      json.encode(quantities),
    );
  }

  Future<void> addToBasket(String productId, {int quantity = 1}) async {
    final basketIds = await getBasketIds();
    basketIds.add(productId);
    await saveBasketIds(basketIds);

    final quantities = await getBasketQuantities();
    quantities[productId] = (quantities[productId] ?? 0) + quantity;
    await saveBasketQuantities(quantities);
  }

  Future<void> removeFromBasket(String productId) async {
    final basketIds = await getBasketIds();
    basketIds.remove(productId);
    await saveBasketIds(basketIds);

    final quantities = await getBasketQuantities();
    quantities.remove(productId);
    await saveBasketQuantities(quantities);
  }

  Future<void> updateBasketQuantity(String productId, int quantity) async {
    if (quantity <= 0) {
      await removeFromBasket(productId);
      return;
    }

    final basketIds = await getBasketIds();
    if (!basketIds.contains(productId)) {
      basketIds.add(productId);
      await saveBasketIds(basketIds);
    }

    final quantities = await getBasketQuantities();
    quantities[productId] = quantity;
    await saveBasketQuantities(quantities);
  }
}

