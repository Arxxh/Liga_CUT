import 'package:flutter/material.dart';
import 'package:liga/models/partidos_model.dart';

//Aqui le damos vida a las Cards de Partidos_Screen mostrando extras y eso (_　_)。゜zｚＺ //

class DetallesPartidoScreen extends StatelessWidget {
  final Partido partido;

  const DetallesPartidoScreen({super.key, required this.partido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${partido.equipoA} vs ${partido.equipoB}")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${partido.equipoA} vs ${partido.equipoB}",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text("Fecha: ${partido.fecha}"),
            Text("Hora: ${partido.hora}"),
            Text("Estadio: ${partido.estadio}"),
            const SizedBox(height: 20),
            const Text(
              "Detalles adicionales",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Aquí puedes agregar alineaciones, estadísticas, resultados previos y cualquier información relevante del partido.",
            ),
          ],
        ),
      ),
    );
  }
}
