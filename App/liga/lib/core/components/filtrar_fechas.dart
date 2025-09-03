import 'package:flutter/material.dart';
import 'package:liga/models/partidos_model.dart';

// Este es un componente para filtrar datos desde el model de partidos agarra las fechas y las filtra o(TヘTo) //

class FiltrarFechas extends StatelessWidget {
  final String valorActual;
  final List<Partido> partidos;
  final ValueChanged<String> onFiltroCambiado;

  const FiltrarFechas({
    super.key,
    required this.valorActual,
    required this.partidos,
    required this.onFiltroCambiado,
  });

  @override
  Widget build(BuildContext context) {
    final fechas = <String>{};
    for (var p in partidos) {
      fechas.add(p.fecha);
    }

    final opciones = ["Todos", ...fechas.toList()..sort()];

    return Row(
      children: [
        const Text("Filtrar por fecha: "),
        const SizedBox(width: 12),
        SizedBox(
          width: 120,
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
