import 'package:flutter/material.dart';
import 'package:liga/core/components/filtrar_fechas.dart';
import 'package:liga/core/custom_widgets/partido_card.dart';
import 'package:liga/models/partidos_model.dart';
import 'package:liga/data/partidos_data.dart';

// La Screen de partidos ya bien optimizada y con filtrador por fechas (；′⌒`) //

class PartidosScreen extends StatefulWidget {
  const PartidosScreen({super.key});

  @override
  State<PartidosScreen> createState() => _PartidosScreenState();
}

class _PartidosScreenState extends State<PartidosScreen>
    with SingleTickerProviderStateMixin {
  String filtro = "Todos";
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Partido> getPartidosFiltrados() {
    if (filtro == "Todos") return partidos;
    return partidos.where((p) => p.fecha == filtro).toList();
  }

  @override
  Widget build(BuildContext context) {
    final partidosFiltrados = getPartidosFiltrados();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FiltrarFechas(
              valorActual: filtro,
              partidos: partidos,
              onFiltroCambiado: (nuevoFiltro) {
                setState(() {
                  filtro = nuevoFiltro;
                  _controller.reset();
                  _controller.forward();
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: partidosFiltrados.length,
                itemBuilder: (context, index) {
                  final animation = Tween<double>(begin: 0, end: 1).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Interval(
                        index / partidosFiltrados.length,
                        1.0,
                        curve: Curves.easeIn,
                      ),
                    ),
                  );
                  return FadeTransition(
                    opacity: animation,
                    child: PartidoCard(partido: partidosFiltrados[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
