import 'package:catalog_product/core/theme/cubit/theme_cubit.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class ThemeService {
  static const String _themeModeKey = 'theme_mode';

    Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  
   Future<void> setThemeMode(ThemeState themeMode) async {
    final prefs = await _prefs;
    await prefs.setString(
      _themeModeKey,
      themeMode.when(
        light: () => 'light',
        dark: () => 'dark',
        system: () => 'system',
      ),
    );
  }

  Future<ThemeState> getThemeMode() async {
    final prefs = await _prefs;
    final themeString = prefs.getString(_themeModeKey) ?? 'system';
    switch (themeString) {
      case 'dark':
        return const ThemeState.dark();
      case 'light':
        return const ThemeState.light();
      case 'system':
      default:
        return const ThemeState.system();
    }
  }
  }