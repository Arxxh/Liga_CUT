import 'package:flutter/material.dart';
import 'package:liga/core/custom_widgets/custom_drawer.dart';
import 'package:liga/core/custom_widgets/custom_navbar.dart';
import 'package:liga/screens/inicio_screen.dart';
import 'package:liga/screens/partidos_screen.dart';
import 'package:liga/screens/equipos_screen.dart';

// Por tu cara se que quieres 50 mil litros de fentanilo (〃￣︶￣)人(￣︶￣〃) //
// Aqui solo establezco las pantallas constantes para que se vea como Sonos y la animacion //

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    InicioScreen(),
    PartidosScreen(),
    EquiposScreen(),
  ];

  late List<bool> _loadedScreens;

  @override
  void initState() {
    super.initState();
    _loadedScreens = List.generate(screens.length, (index) => index == 0);
  }

  void _onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
      _loadedScreens[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Stack(
        children: List.generate(screens.length, (index) {
          final bool isActive = selectedIndex == index;
          final bool isLoaded = _loadedScreens[index];

          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isActive ? 1 : 0,
            child: Offstage(
              offstage: !isActive,
              child: TickerMode(
                enabled: isActive,
                child: isLoaded ? screens[index] : const SizedBox.shrink(),
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: CustomNavbar(
        selectedIndex: selectedIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}
