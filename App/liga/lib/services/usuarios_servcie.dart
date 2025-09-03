import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:liga/models/usuarios_model.dart';

// Aqui en un futuro va a enviar la info de Usuarios a FastAPI //
Future<void> registrarUsuario(Usuario usuario) async {
  final url = Uri.parse("http://MI-FASTAPI.com/usuarios/");
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(usuario.toJson()),
  );

  if (response.statusCode == 201) {
    print("Usuario registrado correctamente");
  } else {
    print("Error: ${response.statusCode} - ${response.body}");
  }
}

// Obtener todos los usuarios //
Future<List<Usuario>> obtenerUsuarios() async {
  final url = Uri.parse("http://MI-FASTAPI.com/usuarios/");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Usuario.fromJson(json)).toList();
  } else {
    throw Exception("Error al obtener usuarios: ${response.statusCode}");
  }
}
