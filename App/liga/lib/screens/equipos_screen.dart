import 'package:flutter/material.dart';
import 'package:liga/core/components/filtrar_equipos.dart';
import 'package:liga/data/equipos_data.dart';
import 'package:liga/models/equipos_model.dart';

//La Screen de equipos aqui solo esta el filtro de equipos, la animacion y su diseño ＼（〇_ｏ）／ //

class EquiposScreen extends StatefulWidget {
  const EquiposScreen({super.key});

  @override
  State<EquiposScreen> createState() => _EquiposScreenState();
}

class _EquiposScreenState extends State<EquiposScreen>
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

  List<Equipo> getEquiposFiltrados() {
    if (filtro == "Todos") return equipos;
    return equipos.where((e) => e.nombre == filtro).toList();
  }

  @override
  Widget build(BuildContext context) {
    final equiposFiltrados = getEquiposFiltrados();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FiltrarEquipos(
              valorActual: filtro,
              equipos: equipos,
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
                itemCount: equiposFiltrados.length,
                itemBuilder: (context, index) {
                  final animation = Tween<double>(begin: 0, end: 1).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Interval(
                        index / equiposFiltrados.length,
                        1.0,
                        curve: Curves.easeIn,
                      ),
                    ),
                  );
                  return FadeTransition(
                    opacity: animation,
                    child: Card(
                      margin: const EdgeInsets.all(4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                      child: ListTile(
                        title: Text(
                          equiposFiltrados[index].nombre,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          "Director: ${equiposFiltrados[index].directorTecnico}",
                        ),
                      ),
                    ),
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
