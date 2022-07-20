import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chipidei/pages/noticias/noticias_editar.dart';
import 'package:chipidei/pages/noticias/registro_noticias_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../services/firestore_service.dart';

class GestionNoticiasPage extends StatefulWidget {
  GestionNoticiasPage({Key? key}) : super(key: key);

  @override
  State<GestionNoticiasPage> createState() => _GestionNoticiasPageState();
}

class _GestionNoticiasPageState extends State<GestionNoticiasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gestion de noticias")),
      body: Container(
        child: StreamBuilder(
          stream: fetch(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var noticia = snapshot.data.docs[index];
                    return ListTile(
                      onLongPress: () {
                        AwesomeDialog(
                          btnOkText: "Editar",
                          btnCancelText: "Cancelar",
                          context: context,
                          dialogType: DialogType.WARNING,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Estas seguro que deseas editar esta noticia?',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      NoticiasEditar(noticia.id),
                                ));
                          },
                        )..show();
                      },
                      title: Text('${noticia['titulo']}'),
                      trailing: TextButton(
                        child: Icon(
                          MdiIcons.trashCan,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          AwesomeDialog(
                            btnOkText: "Eliminar",
                            btnCancelText: "Cancelar",
                            context: context,
                            dialogType: DialogType.WARNING,
                            animType: AnimType.BOTTOMSLIDE,
                            title:
                                'Estas seguro que deseas eliminar esta noticia?',
                            desc: 'No podras volver a recuperarla',
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              FirestoreService().noticiasBorrar(noticia.id);
                            },
                          )..show();
                        },
                      ),
                    );
                  },
                );
              }
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => RegistroNoticiasPage(),
              ));
        },
        child: Icon(MdiIcons.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Stream<dynamic> fetch() {
    return FirestoreService().noticias();
  }
}
