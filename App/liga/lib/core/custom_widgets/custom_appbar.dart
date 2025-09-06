import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Este es el AppBar que siempre esta ahi activo y que solo se manda a llamar a Home_Screen ⊙﹏⊙∥ //

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppbar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final height = isLandscape ? 48.0 : kToolbarHeight;

    return SafeArea(
      child: SizedBox(
        height: height,
        child: AppBar(
          toolbarHeight: height,
          elevation: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          systemOverlayStyle: Theme.of(context).brightness == Brightness.dark
              ? SystemUiOverlayStyle.light.copyWith(
                  statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
                )
              : SystemUiOverlayStyle.dark.copyWith(
                  statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
                ),
          title: Text(
            title,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          iconTheme: Theme.of(context).appBarTheme.iconTheme,
          centerTitle: true,
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
