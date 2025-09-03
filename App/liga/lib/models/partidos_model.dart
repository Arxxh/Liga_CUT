/* Aqui es el modelo o creador de donde va a venir la info de la BD y aparte
   es el convertidor y desconvertidor de JSON ~~>_<~~ */

class Partido {
  final String equipoA;
  final String equipoB;
  final String fecha;
  final String hora;
  final String estadio;

  Partido({
    required this.equipoA,
    required this.equipoB,
    required this.fecha,
    required this.hora,
    required this.estadio,
  });

  // Convertir a JSON //
  Map<String, dynamic> toJson() {
    return {
      'equipoA': equipoA,
      'equipoB': equipoB,
      'fecha': fecha,
      'hora': hora,
      'estadio': estadio,
    };
  }

  // Convertir desde JSON //
  factory Partido.fromJson(Map<String, dynamic> json) {
    return Partido(
      equipoA: json['equipoA'],
      equipoB: json['equipoB'],
      fecha: json['fecha'],
      hora: json['hora'],
      estadio: json['estadio'],
    );
  }
}
