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
  Future<LinkedHashMap<String, dynamic>> getEducadora(String rut_educadora) async {
    var uri = Uri.parse('$apiURL/educadora/$rut_educadora');
    var respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return new LinkedHashMap();
    }
  }

  //POST
  Future<List<dynamic>> agregarEducadora(
      String rut_educadora, 
      String nom_educadora, 
      String apell_educadora,
      String fecha_nac_educadora, 
      String fecha_adm_educadora, 
      String tel_educadora,
      String direccion_educadora
      ) async {
    var uri = Uri.parse('$apiURL/evento');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'appication/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut_educadora': rut_educadora,
          'nom_educadora': nom_educadora,
          'apell_educadora': apell_educadora,
          'fecha_nac_educadora': fecha_nac_educadora,
          'fecha_adm_educadora': fecha_adm_educadora,
          'tel_educadora': tel_educadora,
          'direccion_educadora': direccion_educadora
        }));
    return json.decode(respuesta.body);
  }

  //PUT
  Future<LinkedHashMap<String, dynamic>> editarEducadora(
      String rut_educadora, 
      String rut_nuevo_educadora, 
      String nom_educadora, 
      String apell_educadora,
      String fecha_nac_educadora, 
      String fecha_adm_educadora, 
      String tel_educadora,
      String direccion_educadora
      ) async {
    var uri = Uri.parse('$apiURL/evento/$rut_educadora');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'appication/json'
        },
        body: jsonEncode(<String, dynamic>{
          'rut_educadora': rut_educadora,
          'rut_nuevo_educadora': rut_nuevo_educadora,
          'nom_educadora': nom_educadora,
          'apell_educadora': apell_educadora,
          'fecha_nac_educadora': fecha_nac_educadora,
          'fecha_adm_educadora': fecha_adm_educadora,
          'tel_educadora': tel_educadora,
          'direccion_educadora': direccion_educadora
        }));
    return json.decode(respuesta.body);
  } 

  //DELETE
  Future<bool> borrarEducadora(String rut_educadora) async {
    var uri = Uri.parse('$apiURL/educadora/$rut_educadora');
    var respuesta = await http.delete(uri);
    return respuesta.statusCode == 200;
  }
}