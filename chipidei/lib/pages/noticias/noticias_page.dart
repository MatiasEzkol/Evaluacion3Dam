// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:chipidei/pages/home_page.dart';
import 'package:chipidei/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    GoogleSignInAccount? googleUser =
                        await GoogleSignIn().signIn();
                    GoogleSignInAuthentication? googleAuth =
                        await googleUser?.authentication;
                    AuthCredential credential = GoogleAuthProvider.credential(
                        accessToken: googleAuth?.accessToken,
                        idToken: googleAuth?.idToken);
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithCredential(credential);
                    log('${userCredential.user?.displayName}');
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                        
                    sp.setString('user', '${userCredential.user?.displayName}');
                  } catch (e) {
                    log(e.toString());
                  }
                },
                child: Icon(MdiIcons.google),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                  backgroundColor: MaterialStateProperty.all(
                      Colors.blue), // <-- Button color
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(MaterialState.pressed))
                      return Colors.red; // <-- Splash color
                  }),
                ),
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
                              subtitle: Text(
                                  'Descripcion: ${producto['descripcion']}'),
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
                          },
                        );
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
