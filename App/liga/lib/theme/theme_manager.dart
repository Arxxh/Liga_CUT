import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Nota mental, no moverle a nada de esto por todo lo que mas quiera (T_T)(T_T)(T_T) //

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  static const _key = 'isDarkTheme';

  /// Cambia el tema y guarda la preferencia //
  void toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDark);
  }

  /// Carga la preferencia de tema al iniciar la app //
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_key) ?? false;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

// Instancia global //
final ThemeManager themeManager = ThemeManager();
