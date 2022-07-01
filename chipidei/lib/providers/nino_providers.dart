import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NinoProviders {
  final String apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getNino() async {
    var uri = Uri.parse('$apiURL/nino');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> ninoAgregar(
    String rut_nino,
    String nom_nino,
    String apell_nino,
    String fecha_nac_nino,
    String fecha_adm_nino,
    String nom_padre_nino,
    String nom_madre_nino,
    String tel_nino,
    String direccion_nino,
    String nivel,
  ) async {
    var uri = Uri.parse('$apiURL/nino');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut_nino': rut_nino,
          'nom_nino': nom_nino,
          'apell_nino': apell_nino,
          'fecha_nac_nino': fecha_nac_nino,
          'fecha_adm_nino': fecha_adm_nino,
          'nom_padre_nino': nom_padre_nino,
          'nom_madre_nino': nom_madre_nino,
          'tel_nino': tel_nino,
          'direccion_nino': direccion_nino,
          'nivel': nivel
        }));
    return json.decode(respuesta.body);
  }

  Future<bool> educadoraBorrar(String cod_nino) async {
    var uri = Uri.parse('$apiURL/nino/$cod_nino');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
