
import 'dart:developer';

import 'package:chipidei/pages/nino/perfil_nino_page.dart';
import 'package:chipidei/providers/ninos_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ListaNinosPage extends StatefulWidget {
  // ListaNinosPage({Key? key}) : super(key: key);

  @override
  State<ListaNinosPage> createState() => _ListaNinosPageState();
}

class _ListaNinosPageState extends State<ListaNinosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Niños'),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: NinosProvider().getNinos(),
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
                        var nino = snap.data[index];

                        return Slidable(
                            child: ListTile(
                              leading: Icon(MdiIcons.account),
                              title: Text(nino['nom_nino']),
                              subtitle: Text(nino['cod_nino']),
                            ),
                            startActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    MaterialPageRoute route = MaterialPageRoute(
                                      builder: (context) => PerfilNinoPage(),
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
                                    String cod_nino = nino['cod_nino'];
                                    confirmDialog(context, nino['nom_nino'])
                                        .then((confirma) {
                                      if (confirma) {
                                        NinosProvider()
                                            .borrarNino(cod_nino)
                                            .then((borradoOk) {
                                          if (borradoOk) {
                                            snap.data.removeAt(index);
                                            //set
                                            showSnackBar('Niño borrado');
                                            setState(() {});
                                          } else {
                                            showSnackBar(
                                                'No se pudo borrar niño');
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

  Future<dynamic> confirmDialog(BuildContext context, String nino) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirma borrado'),
            content: Text('Seguro que quiere borrar a nino $nino?'),
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
