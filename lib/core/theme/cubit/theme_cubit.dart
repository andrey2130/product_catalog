import 'package:bloc/bloc.dart';
import 'package:catalog_product/core/storage/storage_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

@LazySingleton()
class ThemeCubit extends Cubit<ThemeState> {
  final StorageService _storageService;

  ThemeCubit(this._storageService) : super(const ThemeState.light()) {
    _loadTheme();
  }

  void _loadTheme() {
    _storageService.getThemeMode().then((savedTheme) {
      emit(savedTheme);
    });
  }

  Future<void> toggleTheme() async {
    final newTheme = state.when(
      light: () => const ThemeState.dark(),
      dark: () => const ThemeState.light(),
    );

    await _storageService.setThemeMode(newTheme);
    emit(newTheme);
  }
}
