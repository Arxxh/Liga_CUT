import 'package:flutter/material.dart';

// Estas Cards corresponden a la de las noticias de Inicio_Screen {{{(>_<)}}} //

class NoticiasCard extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const NoticiasCard({
    super.key,
    required this.titulo,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFF0056A4), width: 1.5),
        ),
        elevation: 4,
        color: theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(descripcion, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      ),
    );
  }
}
