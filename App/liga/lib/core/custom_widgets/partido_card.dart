import 'package:flutter/material.dart';
import 'package:liga/models/partidos_model.dart';
import 'package:liga/screens/sub_screens/detalles_partido_screen.dart';

// Aqui estan las cards de los partidos que te mandan a los detalles, un gran detalle jajaja (～￣▽￣)～ //

class PartidoCard extends StatelessWidget {
  final Partido partido;

  const PartidoCard({super.key, required this.partido});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetallesPartidoScreen(partido: partido),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${partido.equipoA} vs ${partido.equipoB}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Fecha: ${partido.fecha}"),
                  Text("Hora: ${partido.hora}"),
                ],
              ),
              const SizedBox(height: 8),
              Text("Lugar: ${partido.estadio}"),
            ],
          ),
        ),
      ),
    );
  }
}
