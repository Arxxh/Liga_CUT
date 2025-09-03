import 'package:flutter/material.dart';

// Este es el AppBar que siempre esta ahi activo y que solo se manda a llamar a Home_Screen ⊙﹏⊙∥ //

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      title: Text(title, style: Theme.of(context).appBarTheme.titleTextStyle),
      iconTheme: Theme.of(context).appBarTheme.iconTheme,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
