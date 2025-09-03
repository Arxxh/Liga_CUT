import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:liga/models/goles_partido_model.dart';

// Aqui en un futuro va a enviar la info de GolesPartido a FastAPI //

Future<void> enviarGolPartido(GolPartido golPartido) async {
  final url = Uri.parse('http://AQUI_VA_URL_DEL_FASTAPI.com/goles_partido/');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(golPartido.toJson()),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    print('Gol enviado correctamente');
  } else {
    print('Error al enviar gol: ${response.statusCode}');
  }
}
