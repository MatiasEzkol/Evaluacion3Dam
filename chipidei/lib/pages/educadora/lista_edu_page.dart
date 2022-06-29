import 'dart:developer';

import 'package:chipidei/pages/educadora/perfil_edu_page.dart';
import 'package:chipidei/providers/educadoras_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ListaEduPage extends StatefulWidget {
  ListaEduPage({Key? key}) : super(key: key);

  @override
  State<ListaEduPage> createState() => _ListaEduPageState();
}

class _ListaEduPageState extends State<ListaEduPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Educadoras'),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: EducadorasProvider().getEducadoras(),
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
                        var educadora = snap.data[index];

                        return Slidable(
                            child: ListTile(
                              leading: Icon(MdiIcons.account),
                              title: Text(educadora['nom_educadora']),
                              subtitle: Text(educadora['cod_educadora']),
                            ),
                            startActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    MaterialPageRoute route = MaterialPageRoute(
                                      builder: (context) => PerfilEduPage(),
                                    );
                                    Navigator.push(context, route)
                                        .then((value) {
                                      setState(() {});
                                    });
                                  },
                                  backgroundColor: Colors.amber,
                                  icon: MdiIcons.pen,
                                  label: 'Ir a perfil',
                                )
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    String cod_educadora =
                                        educadora['cod_educadora'];
                                    confirmDialog(
                                            context, educadora['nom_educadora'])
                                        .then((confirma) {
                                      if (confirma) {
                                        EducadorasProvider()
                                            .borrarEducadora(cod_educadora)
                                            .then((borradoOk) {
                                          if (borradoOk) {
                                            snap.data.removeAt(index);
                                            //set
                                            showSnackBar('Educadora borrada');
                                            setState(() {});
                                          } else {
                                            showSnackBar(
                                                'No se pudo borrar educadora');
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

  Future<dynamic> confirmDialog(BuildContext context, String educadora) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirma borrado'),
            content: Text('Seguro que quiere borrar a educadora $educadora?'),
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
