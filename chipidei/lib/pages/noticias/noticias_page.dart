// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

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
              Noticias(),
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
