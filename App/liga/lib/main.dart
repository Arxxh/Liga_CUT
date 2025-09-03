import 'package:flutter/material.dart';
import 'package:liga/animations/theme_overlay_animation.dart';
import 'package:liga/screens/home_screen.dart';
import 'package:liga/theme/theme_constants.dart' show darkTheme, lightTheme;
import 'package:liga/theme/theme_manager.dart';

// El main aqui es donde todo comienza y donde establezco la animacion del diablo de cambio de tema ＞﹏＜ //

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Carga la preferencia del tema antes de iniciar la app //
  await themeManager.loadTheme();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _showOverlay = false;

  @override
  void initState() {
    super.initState();
    themeManager.addListener(_onThemeChange);
  }

  @override
  void dispose() {
    themeManager.removeListener(_onThemeChange);
    super.dispose();
  }

  void _onThemeChange() async {
    if (!mounted) return;

    setState(() => _showOverlay = true);

    await Future.delayed(const Duration(milliseconds: 200));

    if (!mounted) return;
    setState(() => _showOverlay = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.themeMode,
      home: Stack(
        children: [
          const HomeScreen(),
          ThemeOverlayAnimation(show: _showOverlay),
        ],
      ),
    );
  }
}
