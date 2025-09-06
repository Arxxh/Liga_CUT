class Noticia {
  final int? id;
  final String titulo;
  final String descripcion;
  final DateTime? fecha;

  Noticia({
    this.id,
    required this.titulo,
    required this.descripcion,
    this.fecha,
  });

  // Convertir a JSON (para enviar a FastAPI)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
      'fecha': fecha?.toIso8601String(),
    };
  }

  // Crear desde JSON (cuando viene del backend)
  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      id: json['id'],
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      fecha: json['fecha'] != null ? DateTime.parse(json['fecha']) : null,
    );
  }
}
