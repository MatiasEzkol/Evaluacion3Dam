import 'dart:developer';

import 'package:chipidei/pages/nino/perfil_nino_page.dart';
import 'package:chipidei/providers/ninos_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../utils/confirmDialog.dart';
import '../../utils/showSnackBar.dart';

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
                  future: NinosProviders().getNinos(),
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
                                      builder: (context) =>
                                          PerfilNinoPage(nino['cod_nino']),
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
                                    confirmDialog(
                                            context, 'niño', nino['nom_nino'])
                                        .then((confirma) {
                                      if (confirma) {
                                        NinosProviders()
                                            .borrarNino(cod_nino)
                                            .then((borradoOk) {
                                          if (borradoOk) {
                                            snap.data.removeAt(index);
                                            //set
                                            showSnackBar(
                                                'Niño borrado', this.context);
                                            setState(() {});
                                          } else {
                                            showSnackBar(
                                                'No se pudo borrar niño',
                                                this.context);
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
}
