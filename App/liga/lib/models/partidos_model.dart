/* Aqui es el modelo o creador de donde va a venir la info de la BD y aparte
   es el convertidor y desconvertidor de JSON ~~>_<~~ */

class Partido {
  final int? id;
  final String equipoA;
  final String equipoB;
  final String fecha;
  final String hora;
  final String estadio;

  Partido({
    this.id,
    required this.equipoA,
    required this.equipoB,
    required this.fecha,
    required this.hora,
    required this.estadio,
  });

  // Convertir a JSON (para enviar a FastAPI) //
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'equipo_a': equipoA,
      'equipo_b': equipoB,
      'fecha': fecha,
      'hora': hora,
      'estadio': estadio,
    };
  }

  // Crear objeto desde JSON (cuando viene de FastAPI) //
  factory Partido.fromJson(Map<String, dynamic> json) {
    return Partido(
      id: json['id'],
      equipoA: json['equipo_a'],
      equipoB: json['equipo_b'],
      fecha: json['fecha'],
      hora: json['hora'],
      estadio: json['estadio'],
    );
  }
}
