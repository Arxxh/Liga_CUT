import 'package:flutter/material.dart';

// Mi Navbar que hace que se vea eggcelente la app ∬ψ(｀∇´)ψ //

class CustomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_soccer),
          label: "Partidos",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: "Equipos"),
      ],
    );
  }
}
