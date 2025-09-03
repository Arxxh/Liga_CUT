/* Aqui es el modelo o creador de donde va a venir la info de la BD y aparte
   es el convertidor y desconvertidor de JSON ~~>_<~~ */

class Equipo {
  final String nombre;
  final String directorTecnico;
  int partidosJugados;
  int victorias;
  int empates;
  int derrotas;
  int golesAFavor;
  int golesEnContra;
  int puntos;

  Equipo({
    required this.nombre,
    required this.directorTecnico,
    this.partidosJugados = 0,
    this.victorias = 0,
    this.empates = 0,
    this.derrotas = 0,
    this.golesAFavor = 0,
    this.golesEnContra = 0,
    this.puntos = 0,
  });

  // Convertir a JSON //
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'director_tecnico': directorTecnico,
      'partidos_jugados': partidosJugados,
      'victorias': victorias,
      'empates': empates,
      'derrotas': derrotas,
      'goles_a_favor': golesAFavor,
      'goles_en_contra': golesEnContra,
      'puntos': puntos,
    };
  }

  // Crear desde JSON //
  factory Equipo.fromJson(Map<String, dynamic> json) {
    return Equipo(
      nombre: json['nombre'],
      directorTecnico: json['director_tecnico'],
      partidosJugados: json['partidos_jugados'] ?? 0,
      victorias: json['victorias'] ?? 0,
      empates: json['empates'] ?? 0,
      derrotas: json['derrotas'] ?? 0,
      golesAFavor: json['goles_a_favor'] ?? 0,
      golesEnContra: json['goles_en_contra'] ?? 0,
      puntos: json['puntos'] ?? 0,
    );
  }
}
