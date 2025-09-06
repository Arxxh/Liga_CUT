import 'package:flutter/material.dart';
import 'package:liga/core/custom_widgets/prox_partidos_card.dart';

class ProximosPartidosSection extends StatelessWidget {
  const ProximosPartidosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            "Próximos partidos",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 16),
          ProxPartidosCard(),
        ],
      ),
    );
  }
}
