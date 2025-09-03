import 'package:flutter/material.dart';
import 'package:liga/core/custom_widgets/custom_appbar.dart';
import 'package:liga/core/custom_widgets/custom_drawer.dart';
import 'package:liga/core/custom_widgets/custom_navbar.dart';
import 'package:liga/screens/inicio_screen.dart';
import 'package:liga/screens/partidos_screen.dart';
import 'package:liga/screens/equipos_screen.dart';

// Por tu cara se que quieres 50 mil litros de fentanilo (〃￣︶￣)人(￣︶￣〃) //
// Aqui solo estableszco las pantallas constantes para que se vea como Sonos y la animacion //

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "Liga de Fútbol"),
      drawer: const CustomDrawer(),
      body: Stack(
        children: List.generate(screens.length, (index) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: selectedIndex == index ? 1 : 0,
            child: Offstage(
              offstage: selectedIndex != index,
              child: screens[index],
            ),
          );
        }),
      ),
      bottomNavigationBar: CustomNavbar(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
