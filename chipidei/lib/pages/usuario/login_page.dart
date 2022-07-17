import 'dart:developer';

import 'package:chipidei/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String error = '';
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

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
            ),
          ),
        ],
        title: Text('Login'),
        backgroundColor: Color(0xFF363942),
        leading: Icon(
          MdiIcons.firebase,
          color: Colors.amber,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Expanded(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                controller: emailCtrl,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                controller: passCtrl,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Iniciar sesión'),
                  onPressed: () async {
                    UserCredential? userCredential;
                    try {
                      userCredential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: emailCtrl.text.trim().toString(),
                        password: passCtrl.text.trim().toString(),
                      );
                      // log('user credencial');
                      // print(userCredential);
                      log('Después del log');

                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      sp.setString('userEmail', emailCtrl.text.trim());

                      MaterialPageRoute route =
                          MaterialPageRoute(builder: (context) => HomePage());
                      Navigator.pushReplacement(context, route);
                    } on FirebaseAuthException catch (ex) {
                      switch (ex.code) {
                        case 'user-not-found':
                          error = 'Usuario no existe';
                          break;
                        case 'wrong-password':
                          error = 'Contraseña no valida';
                          break;
                        case 'user-disabled':
                          error = 'Cuenta desactivada';
                          break;
                        default:
                          error = 'Error desconocido';
                      }

                      setState(() {});
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Google'),
                  onPressed: () async {
                    try {
                      GoogleSignInAccount? googleUser =
                          await GoogleSignIn().signIn();
                      GoogleSignInAuthentication? googleAuth =
                          await googleUser?.authentication;
                      AuthCredential credential = GoogleAuthProvider.credential(
                          accessToken: googleAuth?.accessToken,
                          idToken: googleAuth?.idToken);
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithCredential(credential);
                      log('${userCredential.user?.displayName}');
                    } catch (e) {
                      log(e.toString());
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
