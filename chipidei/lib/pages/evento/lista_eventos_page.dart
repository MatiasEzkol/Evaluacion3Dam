import 'dart:developer';
import 'package:chipidei/providers/evento_providers.dart';
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
                                    confirmDialog(context,
                                            evento['descripcion_evento'])
                                        .then((confirma) {
                                      if (confirma) {
                                        EventosProvider()
                                            .borrarEvento(cod_evento)
                                            .then((borradoOk) {
                                          if (borradoOk) {
                                            snap.data.removeAt(index);
                                            //set
                                            showSnackBar('Evento borrado');
                                            setState(() {});
                                          } else {
                                            showSnackBar(
                                                'No se pudo borrar evento');
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

  Future<dynamic> confirmDialog(BuildContext context, String evento) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirma borrado'),
            content: Text('Seguro que quiere borrar a evento $evento?'),
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
