import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NinosProviders {
  final String apiURL = 'http://10.0.2.2:8000/api';

  //GET ALL
  Future<List<dynamic>> getNinos() async {
    var uri = Uri.parse('$apiURL/nino');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  //GET ONE
  Future<LinkedHashMap<String, dynamic>> getNino( String codNino ) async {
    var uri = Uri.parse('$apiURL/nino/$codNino');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  //POST
  Future<List<dynamic>> agregarNino(
    String cod_nino, 
    String nom_nino,
    String apell_nino, 
    String foto_nino, 
    DateTime fecha_nac_nino
    ) async {
    var uri = Uri.parse('$apiURL/nino');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'appication/json'
        },
        body: jsonEncode(<String, dynamic>{
          'cod_nino': cod_nino, 
          'nom_nino': nom_nino, 
          'apell_nino': apell_nino, 
          'foto_nino': foto_nino, 
          'fecha_nac_nino': fecha_nac_nino
        }));
    return json.decode(respuesta.body);
  }

  //PUT
  Future<LinkedHashMap<String, dynamic>> editarNino(
    String cod_nino, 
    String cod_nino_nuevo, 
    String nom_nino, 
    String apell_nino, 
    String foto_nino, 
    DateTime fecha_nac_nino) async {
    var uri = Uri.parse('$apiURL/nino/$cod_nino');
    var respuesta = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'appication/json'
        },
        body: jsonEncode(<String, dynamic>{
          'cod_nino': cod_nino, 
          'cod_nino_nuevo': cod_nino_nuevo, 
          'nom_nino': nom_nino, 
          'apell_nino': apell_nino, 
          'foto_nino': foto_nino, 
          'fecha_nac_nino': fecha_nac_nino
          }));
    return json.decode(respuesta.body);
  }

  //DELETE
  Future<bool> borrarNino( String cod_nino ) async {
    var uri = Uri.parse('$apiURL/nino/$cod_nino');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}
