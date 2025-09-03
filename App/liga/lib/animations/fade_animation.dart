import 'package:flutter/material.dart';

// Can you meet me halfway? Right at the borderline Is where I'm gonna wait for you I'll be lookin' out night and day //
// Took my heart to the limit, and this is where I stay ♪♪♪ ( *︾▽︾) //

class FadeAnimation extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const FadeAnimation({
    super.key,
    required this.child,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: animation, child: child);
  }
}
