import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class EducadoraProviders {
  final String apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getEducadora(String codEducadora) async {
    var uri = Uri.parse('$apiURL/educadora');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> educadoraAgregar(
      String rut_educadora,
      String nom_educadora,
      String apell_educadora,
      String fecha_nac_educadora,
      String fecha_adm_educadora,
      String tel_educadora,
      String direccion_educadora,
      String nivel) async {
    var uri = Uri.parse('$apiURL/educadora');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut_educadora': rut_educadora,
          'nom_educadora': nom_educadora,
          'apell_educadora': apell_educadora,
          'fecha_nac_educadora': fecha_nac_educadora,
          'fecha_adm_educadora': fecha_adm_educadora,
          'tel_educadora': tel_educadora,
          'direccion_educadora': direccion_educadora,
          'nivel': nivel
        }));
    return json.decode(respuesta.body);
  }

  Future<bool> educadoraBorrar(String rut_educadora) async {
    var uri = Uri.parse('$apiURL/educadora/$rut_educadora');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
