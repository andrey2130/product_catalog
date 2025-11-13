import 'package:bloc/bloc.dart';
import 'package:catalog_product/core/storage/theme_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

@LazySingleton()
class ThemeCubit extends Cubit<ThemeState> {
  final ThemeService _themeService;


  ThemeCubit(this._themeService) : super(const ThemeState.system()) {
    _loadTheme();
  }

  void _loadTheme() {
    _themeService.getThemeMode().then((savedTheme) {
      emit(savedTheme);
    });
  }

  Future<void> setTheme(ThemeState theme) async {
    await _themeService.setThemeMode(theme);
    emit(theme);
  }

  Future<void> toggleTheme() async {
    final newTheme = state.when(
      light: () => const ThemeState.dark(),
      dark: () => const ThemeState.system(),
      system: () => const ThemeState.light(),
    );

    await _themeService.setThemeMode(newTheme);
    emit(newTheme);
  }
}
