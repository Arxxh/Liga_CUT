import 'package:flutter/material.dart';

// Las animaciones no son lo mio, creo que me retirare.... (⊙_⊙)？ //

class ThemeOverlayAnimation extends StatelessWidget {
  final bool show;

  const ThemeOverlayAnimation({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      transitionBuilder: (child, animation) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );
        return FadeTransition(
          opacity: curved,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.98, end: 1.0).animate(curved),
            child: child,
          ),
        );
      },
      child: show
          ? Container(key: const ValueKey('overlay'), color: Colors.black54)
          : const SizedBox.shrink(),
    );
  }
}
