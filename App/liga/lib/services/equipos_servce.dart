import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:liga/models/equipos_model.dart';

// Aqui en un futuro va a enviar la info de Equipos a FastAPI //

Future<void> enviarEquipo(Equipo equipo) async {
  final url = Uri.parse(
    'http://AQUI_VA_URL_DEL_FASTAPI_NO_LO_OLVIDES.com/equipos/',
  );
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(equipo.toJson()),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    print('Equipo enviado correctamente');
  } else {
    print('Error al enviar equipo: ${response.statusCode}');
  }
}
