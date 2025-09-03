import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:liga/models/partidos_model.dart';

// Aqui en un futuro va a enviar la info de Partidos a el FastAPI pero aun falta que llueva para eso (。﹏。*) //

Future<void> enviarPartido(Partido partido) async {
  final url = Uri.parse('http://AQUI VA A IR LA URL DEL FASTAPI.com/partidos/');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(partido.toJson()),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    print(
      'Partido enviado correctamente',
    ); // Esto es para ver en consola si si jala o no //
  } else {
    print(
      'Error al enviar: ${response.statusCode}',
    ); // Lo mismo de arriba pero malo //
  }
}
