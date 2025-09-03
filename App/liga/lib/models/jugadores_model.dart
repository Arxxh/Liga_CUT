class Jugador {
  final int? id;
  final String nombre;
  final int edad;
  final String posicion;
  final int equipoId;
  int goles;
  int asistencias;
  int tarjetasAmarillas;
  int tarjetasRojas;
  int minutosJugados;

  Jugador({
    this.id,
    required this.nombre,
    required this.edad,
    required this.posicion,
    required this.equipoId,
    this.goles = 0,
    this.asistencias = 0,
    this.tarjetasAmarillas = 0,
    this.tarjetasRojas = 0,
    this.minutosJugados = 0,
  });

  // Convertir a JSON (para enviar a FastAPI) //

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'edad': edad,
      'posicion': posicion,
      'equipo_id': equipoId,
      'goles': goles,
      'asistencias': asistencias,
      'tarjetas_amarillas': tarjetasAmarillas,
      'tarjetas_rojas': tarjetasRojas,
      'minutos_jugados': minutosJugados,
    };
  }

  // Crear objeto desde JSON (cuando viene de FastAPI) //

  factory Jugador.fromJson(Map<String, dynamic> json) {
    return Jugador(
      id: json['id'],
      nombre: json['nombre'],
      edad: json['edad'],
      posicion: json['posicion'],
      equipoId: json['equipo_id'],
      goles: json['goles'] ?? 0,
      asistencias: json['asistencias'] ?? 0,
      tarjetasAmarillas: json['tarjetas_amarillas'] ?? 0,
      tarjetasRojas: json['tarjetas_rojas'] ?? 0,
      minutosJugados: json['minutos_jugados'] ?? 0,
    );
  }
}
