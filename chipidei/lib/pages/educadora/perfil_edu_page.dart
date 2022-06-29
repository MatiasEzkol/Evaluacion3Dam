import 'package:chipidei/providers/educadoras_providers.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:developer';

class PerfilEduPage extends StatefulWidget {
  String codEducadora;
  PerfilEduPage(this.codEducadora, {Key? key}) : super(key: key);

  @override
  State<PerfilEduPage> createState() => _PerfilEduPageState();
}

class _PerfilEduPageState extends State<PerfilEduPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil educadora',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
          future: EducadorasProviders().getEducadora(widget.codEducadora),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var data = snapshot.data;
            print(data);
            String codigo = data['cod_educadora'];
            String nombre = data['nom_educadora'];

            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(60),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2014/10/18/22/26/squirrel-493790_960_720.jpg"),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nombre: $nombre',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Rut: $codigo',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      height: 1.6),
                                ),
                                Text(
                                  'Curso:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
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
                      color: Colors.amber,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Información de contacto',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Fecha de nacimiento',
                                style: TextStyle(fontSize: 17, height: 2.8),
                              ),
                              Text('12-02-2004',
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Fecha de admisión',
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                              Text('12-04-2022',
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Nombre de mamá',
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                              Text('Sra. Victoria',
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Nombre de papá',
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                              Text('Sr. Benjamin',
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
                      color: Colors.amber,
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
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Número',
                                style: TextStyle(fontSize: 17, height: 2.8),
                              ),
                              Text('+569 XXXX XXXX',
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Dirección',
                                  style: TextStyle(fontSize: 17, height: 2.5)),
                              Text('28. Bird Spring Lane United States',
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
