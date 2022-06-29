import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EducadorasProviders {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //GET ALL
  Future<List<dynamic>> getEducadoras() async {
    var uri = Uri.parse('$apiURL/educadora');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //GET ONE
  Future<LinkedHashMap<String, dynamic>> getEducadora(String codEducadora) async {
    var uri = Uri.parse('$apiURL/educadora/$codEducadora');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  //POST
  // Future<List<dynamic>> agregarEvento(
  //     String cod_educadora, String descripcion_evento) async {
  //   var uri = Uri.parse('$apiURL/evento');
  //   var respuesta = await http.post(uri,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Accept': 'appication/json'
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         'cod_evento': cod_evento,
  //         'descripcion_evento': descripcion_evento,
  //       }));
  //   return json.decode(respuesta.body);
  // }

  //PUT
  // Future<LinkedHashMap<String, dynamic>> editarEvento(
  //     String cod_evento,
  //     String cod_evento_nuevo,
  //     String descripcion_evento) async {
  //   var uri = Uri.parse('$apiURL/nino/$cod_evento');
  //   var respuesta = await http.put(uri,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Accept': 'appication/json'
  //       },
  //       body: jsonEncode(<String, dynamic>{
  //         'cod_nino': cod_evento,
  //         'cod_nino_nuevo': cod_evento_nuevo,
  //         'descripcion_evento': descripcion_evento, 
  //       }));
  //   return json.decode(respuesta.body);
  // }

  //DELETE
  Future<bool> borrarEducadora(String cod_educadora) async {
    var uri = Uri.parse('$apiURL/educadora/$cod_educadora');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}