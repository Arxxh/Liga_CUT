class GolPartido {
  final int? id;
  final int partidoId;
  final int jugadorId;
  final int minuto;

  GolPartido({
    this.id,
    required this.partidoId,
    required this.jugadorId,
    required this.minuto,
  });

  // Convertir a JSON (para enviar a FastAPI) //

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'partido_id': partidoId,
      'jugador_id': jugadorId,
      'minuto': minuto,
    };
  }

  // Crear objeto desde JSON (cuando viene de FastAPI) //

  factory GolPartido.fromJson(Map<String, dynamic> json) {
    return GolPartido(
      id: json['id'],
      partidoId: json['partido_id'],
      jugadorId: json['jugador_id'],
      minuto: json['minuto'],
    );
  }
}
