import 'package:chipidei/providers/ninos_providers.dart';
import 'package:chipidei/utils/truncate.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PerfilNinoPage extends StatefulWidget {
  String rutNino;
  PerfilNinoPage(this.rutNino, {Key? key}) : super(key: key);

  @override
  State<PerfilNinoPage> createState() => _PerfilNinoPageState();
}

class _PerfilNinoPageState extends State<PerfilNinoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mi perfil',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          future: NinosProviders().getNino(widget.rutNino),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var data = snapshot.data;
            String codigo = data['rut_nino'];
            String nombre = data['nom_nino'];
            String apellido = data['apell_nino'];
            String nivel = data['nivel'];

            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 179, 207, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nombre: $nombre $apellido',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Curso: $nivel',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      height: 1.6),
                                ),
                                Text(
                                  'Rut: $codigo',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      height: 1.3),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Información de perfil',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Editar',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 179, 207, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Información personal',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fecha de nacimiento',
                                style: TextStyle(fontSize: 17, height: 2.8),
                              ),
                              Text(truncate(data['fecha_nac_nino'], 10),
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Fecha de admisión',
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                              Text(truncate(data['fecha_adm_nino'], 10),
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Nombre de mamá',
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                              Text(data['nom_madre_nino'],
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Nombre de papá',
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                              Text(data['nom_padre_nino'],
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: double.infinity,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 179, 207, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Información contacto',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Número',
                                style: TextStyle(fontSize: 17, height: 2.8),
                              ),
                              Text(data['tel_nino'],
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Dirección',
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                              Text(data['direccion_nino'],
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
