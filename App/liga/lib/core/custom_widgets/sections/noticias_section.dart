import 'package:flutter/material.dart';
import 'package:liga/core/custom_widgets/noticias_card.dart';
import 'package:liga/data/noticias_data.dart';

class NoticiasSection extends StatelessWidget {
  const NoticiasSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final noticia = noticias[index];
          return NoticiasCard(
            titulo: noticia.titulo,
            descripcion: noticia.descripcion,
          );
        }, childCount: noticias.length),
      ),
    );
  }
}
