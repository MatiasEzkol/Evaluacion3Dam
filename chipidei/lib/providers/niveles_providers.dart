import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NivelesProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //GET ALL
  Future<List<dynamic>> getNiveles() async {
    var uri = Uri.parse('$apiURL/nivel');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //GET ONE
  Future<LinkedHashMap<String, dynamic>> getNivel( String codNivel ) async {
    var uri = Uri.parse('$apiURL/nivel/$codNivel');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  //POST
  Future<List<dynamic>> agregarNivel(
    String cod_nivel, 
    String nom_nivel
    ) async {
    var uri = Uri.parse('$apiURL/nivel');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'appication/json'
        },
        body: jsonEncode(<String, dynamic>{
          'cod_nivel': cod_nivel, 
          'nom_nivel': nom_nivel
        }));
    return json.decode(respuesta.body);
  }

  //PUT
  Future<LinkedHashMap<String, dynamic>> editarNivel(
    String cod_nivel, 
    String cod_nivel_nuevo, 
    String nom_nivel
    ) async {
    var uri = Uri.parse('$apiURL/nivel/$cod_nivel');
    var respuesta = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'appication/json'
        },
        body: jsonEncode(<String, dynamic>{
          'cod_nivel': cod_nivel, 
          'cod_nivel_nuevo': cod_nivel_nuevo, 
          'nom_nivel': nom_nivel
          }));
    return json.decode(respuesta.body);
  }

  //DELETE
  Future<bool> borrarNivel( String cod_nivel ) async {
    var uri = Uri.parse('$apiURL/nivel/$cod_nivel');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}