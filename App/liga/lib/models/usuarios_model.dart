class Usuario {
  final int? id;
  final String nombreUsuario;
  final String correo;
  final String contrasena;

  Usuario({
    this.id,
    required this.nombreUsuario,
    required this.correo,
    required this.contrasena,
  });

  // Convertir a JSON (para enviar a FastAPI) //
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre_usuario': nombreUsuario,
      'correo': correo,
      'contrasena': contrasena,
    };
  }

  // Crear objeto desde JSON (cuando viene de FastAPI) //
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nombreUsuario: json['nombre_usuario'],
      correo: json['correo'],
      contrasena: json['contrasena'],
    );
  }
}
