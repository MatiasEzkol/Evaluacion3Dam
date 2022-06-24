import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class EducadoraProviders {
  final String apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getEducadora() async {
    var uri = Uri.parse('$apiURL/educadora');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> educadoraAgregar(
      String cod_educadora,
      String nombre_educadora,
      String apellido_educadora,
      String fecha_nacimiento) async {
    var uri = Uri.parse('$apiURL/educadora');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'cod_educadora': cod_educadora,
          'nombre_educadora': nombre_educadora,
          'apellido_educadora': apellido_educadora,
          'fecha_nacimiento': fecha_nacimiento
        }));
    return json.decode(respuesta.body);
  }

  Future<bool> educadoraBorrar(String cod_educadora) async {
    var uri = Uri.parse('$apiURL/educadora/$cod_educadora');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
