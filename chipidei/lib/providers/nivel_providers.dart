import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NivelProviders {
  final String apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getNivel() async {
    var uri = Uri.parse('$apiURL/nivel');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> nivelAgregar(
      String cod_nivel, String nom_nivel) async {
    var uri = Uri.parse('$apiURL/nivel');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'cod_nino': cod_nivel,
          'nom_nino': nom_nivel,
        }));
    return json.decode(respuesta.body);
  }

  Future<bool> nivelBorrar(String cod_nivel) async {
    var uri = Uri.parse('$apiURL/nivel/$cod_nivel');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
