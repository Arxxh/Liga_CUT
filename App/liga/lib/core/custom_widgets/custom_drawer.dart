import 'package:flutter/material.dart';
import 'package:liga/core/app_colors.dart';
import 'package:liga/theme/theme_manager.dart';

// Este Drawer es como un hijo para mi, un verdadero exito O(∩_∩)O //

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Drawer(
      width: screenWidth * 0.75,
      child: Container(
        color: AppColors.appbarPrimary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                'Menú de la Liga',
                style: TextStyle(color: AppColors.titleAppbar, fontSize: 20),
              ),
            ),
            const _DrawerItem(icon: Icons.home, text: 'Inicio'),
            ExpansionTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text(
                'Configuración',
                style: TextStyle(color: Colors.white),
              ),
              children: [
                AnimatedBuilder(
                  animation: themeManager,
                  builder: (_, __) {
                    return ListTile(
                      title: const Text(
                        'Tema',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Switch(
                        value: themeManager.themeMode == ThemeMode.dark,
                        onChanged: themeManager.toggleTheme,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _DrawerItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: const TextStyle(color: Colors.white)),
      onTap: () => Navigator.pop(context),
    );
  }
}
