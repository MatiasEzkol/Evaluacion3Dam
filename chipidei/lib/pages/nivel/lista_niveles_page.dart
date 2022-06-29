import 'dart:developer';
import 'package:chipidei/providers/niveles_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ListaNivelesPage extends StatefulWidget {
  ListaNivelesPage({Key? key}) : super(key: key);

  @override
  State<ListaNivelesPage> createState() => _ListaNivelesPageState();
}

class _ListaNivelesPageState extends State<ListaNivelesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Niveles'),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: NivelesProvider().getNiveles(),
                  builder: (context, AsyncSnapshot snap) {
                    if (!snap.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView.separated(
                      itemCount: snap.data.length,
                      separatorBuilder: (_, __) => Divider(),
                      itemBuilder: (context, index) {
                        var nivel = snap.data[index];

                        return Slidable(
                            child: ListTile(
                              leading: Icon(MdiIcons.account),
                              title: Text(nivel['nom_nivel']),
                              subtitle: Text(nivel['cod_nivel']),
                            ),
                            // startActionPane: ActionPane(
                            //   motion: ScrollMotion(),
                            //   children: [
                            //     SlidableAction(
                            //       onPressed: (context) {
                            //         MaterialPageRoute route = MaterialPageRoute(
                            //           builder: (context) => PerfilnivelPage(),
                            //         );
                            //         Navigator.push(context, route)
                            //             .then((value) {
                            //           setState(() {});
                            //         });
                            //       },
                            //       backgroundColor: Colors.amber,
                            //       icon: MdiIcons.pen,
                            //       label: 'Ir a perfil',
                            //     )
                            //   ],
                            // ),
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    String cod_nivel = nivel['cod_nivel'];
                                    confirmDialog(context, nivel['nom_nivel'])
                                        .then((confirma) {
                                      if (confirma) {
                                        NivelesProvider()
                                            .borrarNivel(cod_nivel)
                                            .then((borradoOk) {
                                          if (borradoOk) {
                                            snap.data.removeAt(index);
                                            //set
                                            showSnackBar('Nivel borrado');
                                            setState(() {});
                                          } else {
                                            showSnackBar(
                                                'No se pudo borrar nivel');
                                          }
                                        });
                                      }
                                    });
                                  },
                                  backgroundColor: Colors.red,
                                  icon: MdiIcons.trashCan,
                                  label: 'Borrar',
                                ),
                              ],
                            ));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }

  void showSnackBar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 2),
    ));
  }

  Future<dynamic> confirmDialog(BuildContext context, String nivel) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirma borrado'),
            content: Text('Seguro que quiere borrar a nivel $nivel?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('Cancelar')),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text('Aceptar'))
            ],
          );
        });
  }
}
