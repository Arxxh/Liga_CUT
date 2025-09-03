import 'package:flutter/material.dart';
import 'package:liga/data/partidos_data.dart';

// Aqui se ve la info de los proximos partidos y ya jajajaja Y.Y //

class ProxPartidosCard extends StatelessWidget {
  const ProxPartidosCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: partidos.length,
        itemBuilder: (context, index) {
          final partido = partidos[index];
          return Container(
            width: 200,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF00FF3C), Color(0xFF00AAFF)],
              ),
            ),
            child: Center(
              child: Text(
                "${partido.equipoA} vs ${partido.equipoB}\n"
                "${partido.fecha} - ${partido.hora}\n"
                "${partido.estadio}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
