import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class EventosProviders {
  final String apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getEventos() async {
    var uri = Uri.parse('$apiURL/evento');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> eventoAgregar(
      String cod_evento, String descripcion, String fecha_evento) async {
    var uri = Uri.parse('$apiURL/evento');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'cod_evento': cod_evento,
          'descripcion': descripcion,
          'fecha_evento': fecha_evento
        }));
    return json.decode(respuesta.body);
  }

  Future<bool> eventoBorrar(String cod_evento) async {
    var uri = Uri.parse('$apiURL/evento/$cod_evento');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
