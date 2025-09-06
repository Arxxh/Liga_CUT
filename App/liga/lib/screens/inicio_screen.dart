import 'package:flutter/material.dart';
import 'package:liga/core/custom_widgets/banner_principal.dart';
import 'package:liga/core/custom_widgets/custom_banner.dart';
import 'package:liga/core/custom_widgets/custom_sliver_appbar.dart';
import 'package:liga/core/custom_widgets/sections/noticias_section.dart';
import 'package:liga/core/custom_widgets/sections/proximos_partidos_section.dart';

// El inicio Screen la mejor idea que he tenido en años dios mio como se puede ser tan bueno []~(￣▽￣)~* //

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        const CustomSliverAppbar(title: "Inicio"),
        SliverToBoxAdapter(
          child: BannerPrincipal(
            width: screenWidth,
            height: screenHeight * 0.48,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: CustomBanner(),
          ),
        ),
        const SliverToBoxAdapter(child: ProximosPartidosSection()),
        const NoticiasSection(),
      ],
    );
  }
}
