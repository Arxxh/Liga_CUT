import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:liga/models/jugadores_model.dart';

// Aqui en un futuro va a enviar la info de Jugadores a FastAPI //

Future<void> enviarJugador(Jugador jugador) async {
  final url = Uri.parse('http://AQUI_VA_URL_DEL_FASTAPI.com/jugadores/');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(jugador.toJson()),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    print('Jugador enviado correctamente');
  } else {
    print('Error al enviar jugador: ${response.statusCode}');
  }
}
