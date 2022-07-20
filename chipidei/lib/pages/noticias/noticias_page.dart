// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:chipidei/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../usuario/login_page.dart';

class NoticiasPage extends StatefulWidget {
  NoticiasPage({Key? key}) : super(key: key);

  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  String error = '';
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: TextButton(
                onPressed: () {
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  );
                  Navigator.push(context, route).then((value) {
                    setState(() {});
                  });
                },
                child: Text("Autenticarse"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 81, 3, 82))),
              ),
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
          Container(
            margin: EdgeInsets.all(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(onPressed: () => {}, child: Text('Cerrar'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
