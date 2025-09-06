import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSliverAppbar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final bool pinned;
  final bool floating;
  final bool snap;
  final double expandedHeight;

  const CustomSliverAppbar({
    super.key,
    required this.title,
    this.actions,
    this.pinned = false,
    this.floating = true,
    this.snap = false,
    this.expandedHeight = 56,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: pinned,
      floating: floating,
      snap: snap,
      expandedHeight: expandedHeight,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      systemOverlayStyle: Theme.of(context).brightness == Brightness.dark
          ? SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
            )
          : SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
            ),
      title: Text(title, style: Theme.of(context).appBarTheme.titleTextStyle),
      centerTitle: true,
      actions: actions,
      iconTheme: Theme.of(context).appBarTheme.iconTheme,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 30, right: 16),
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/LogoCUT.png',
                height: expandedHeight * 1,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
