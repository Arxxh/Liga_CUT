import 'package:flutter/material.dart';
import 'package:liga/core/custom_widgets/custom_banner.dart';
import 'package:liga/core/custom_widgets/prox_partidos_card.dart';
import 'package:liga/core/custom_widgets/noticias_card.dart';

// El inicio Screen la mejor idea que he tenido en años dios mio como se puede ser tan bueno []~(￣▽￣)~* //

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bienvenido a la Liga",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            CustomBanner(),
            const SizedBox(height: 20),
            const Text(
              "Próximos partidos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            const ProxPartidosCard(),
            const SizedBox(height: 20),
            Text(
              "Noticias recientes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(8, (index) {
                return NoticiasCard(
                  titulo: "Noticia $index",
                  descripcion: "Descripción de la noticia $index...",
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
