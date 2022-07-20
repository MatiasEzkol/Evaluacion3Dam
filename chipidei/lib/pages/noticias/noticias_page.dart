// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:chipidei/pages/noticias/noticias_editar.dart';
import 'package:chipidei/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NoticiasPage extends StatefulWidget {
  NoticiasPage({Key? key}) : super(key: key);

  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: TextButton(
              onPressed: () {},
              child: Text("Autenticarse"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 81, 3, 82))),
            ),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 231, 98, 231),
        title: Text('Noticias del Jardin CHIPIDEI'),
      ),
      body: Column(
        children: [
          Divider(),
          Expanded(
            child: Column(children: [
              Expanded(
                  child: StreamBuilder(
                      stream: FirestoreService().noticias(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData ||
                            snapshot.connectionState ==
                                ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var producto = snapshot.data!.docs[index];

                    return ListTile(
                      leading: Icon(MdiIcons.cube),
                      title: Text('${producto['titulo']}'),
                      subtitle: Text('Descripcion: ${producto['descripcion']}'),
                      // trailing: TextButton(
                      //   child: Icon(
                      //     MdiIcons.trashCan,
                      //     color: Colors.red,
                      //   ),
                      //   onPressed: () {
                      //     // print(producto.id);
                      //     FirestoreService().noticiasBorrar(producto.id);
                      //   },
                      // ),
                      // onLongPress: () {
                      //   MaterialPageRoute route = MaterialPageRoute(
                      //     builder: (context) => NoticiasEditar(producto.id),
                      //   );
                      //   Navigator.push(context, route);
                      // },
                    );
                  },);
                      })),
            ]),
          ),
        ],
      ),
    );
  }

  Card Noticias() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Titulo'),
            subtitle: Text(
                'Este es el subtitulo del card. Aqui podemos colocar descripción de este card.'),
            leading: Icon(Icons.home),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () => {}, child: Text('Cerrar'))
            ],
          )
        ],
      ),
    );
  }
}
