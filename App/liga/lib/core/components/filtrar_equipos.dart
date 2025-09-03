import 'package:flutter/material.dart';
import 'package:liga/models/equipos_model.dart';

// Esta es la funcion/componente de filtrar por equipos, una ingeniosa idea ¯\_(ツ)_/¯ //

class FiltrarEquipos extends StatelessWidget {
  final String valorActual;
  final List<Equipo> equipos;
  final ValueChanged<String> onFiltroCambiado;

  const FiltrarEquipos({
    super.key,
    required this.valorActual,
    required this.equipos,
    required this.onFiltroCambiado,
  });

  @override
  Widget build(BuildContext context) {
    final nombres = <String>{};
    for (var e in equipos) {
      nombres.add(e.nombre);
    }

    final opciones = ["Todos", ...nombres];

    return Row(
      children: [
        const Text("Filtrar por equipo: "),
        const SizedBox(width: 12),
        SizedBox(
          width: 112,
          child: DropdownButton<String>(
            isExpanded: true,
            value: valorActual,
            items: opciones
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e, overflow: TextOverflow.ellipsis),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                onFiltroCambiado(value);
              }
            },
          ),
        ),
      ],
    );
  }
}
