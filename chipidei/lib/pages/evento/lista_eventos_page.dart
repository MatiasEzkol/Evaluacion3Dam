import 'dart:developer';
import 'package:chipidei/providers/evento_providers.dart';
import 'package:chipidei/utils/confirmDialog.dart';
import 'package:chipidei/utils/showSnackBar.dart';
import 'package:chipidei/utils/truncate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ListaEventosPage extends StatefulWidget {
  ListaEventosPage({Key? key}) : super(key: key);

  @override
  State<ListaEventosPage> createState() => _ListaEventosPageState();
}

class _ListaEventosPageState extends State<ListaEventosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Eventos'),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: EventosProvider().getEventos(),
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
                        var evento = snap.data[index];

                        return Slidable(
                            child: ListTile(
                              leading: Icon(MdiIcons.account),
                              title: Text(evento['descripcion_evento']),
                              subtitle: Text(evento['cod_evento']),
                              trailing:
                                  Text(truncate(evento['created_at'], 10)),
                            ),
                            // startActionPane: ActionPane(
                            //   motion: ScrollMotion(),
                            //   children: [
                            //     SlidableAction(
                            //       onPressed: (context) {
                            //         MaterialPageRoute route = MaterialPageRoute(
                            //           builder: (context) => PerfileventoPage(),
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
                                    String cod_evento = evento['cod_evento'];
                                    confirmDialog(this.context,'evento',
                                            evento['descripcion_evento'])
                                        .then((confirma) {
                                      if (confirma) {
                                        EventosProvider()
                                            .borrarEvento(cod_evento)
                                            .then((borradoOk) {
                                          if (borradoOk) {
                                            snap.data.removeAt(index);
                                            //set
                                            showSnackBar('Evento borrado',this.context);
                                            setState(() {});
                                          } else {
                                            showSnackBar('No se pudo borrar evento',this.context);
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
