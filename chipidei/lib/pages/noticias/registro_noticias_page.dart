import 'package:flutter/material.dart'; 
import '../../services/firestore_service.dart';

class RegistroNoticiasPage extends StatefulWidget {
  RegistroNoticiasPage({Key? key}) : super(key: key);

  @override
  State<RegistroNoticiasPage> createState() => _RegistroNoticiasPageState();
}

class _RegistroNoticiasPageState extends State<RegistroNoticiasPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController tituloCtrl = TextEditingController();
  TextEditingController descripcionCtrl = TextEditingController();

  String errTitulo = '';

  String errDescripcion = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 98, 231),
        title: Text('Registro de Noticias'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(
                controller: tituloCtrl,
                decoration: InputDecoration(
                    labelText: 'Titulo de la Noticia',
                    icon: new Icon(Icons.title)),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errTitulo,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                controller: descripcionCtrl,
                decoration: InputDecoration(
                    labelText: 'Descripcion de la noticia',
                    icon: new Icon(Icons.notifications)),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errDescripcion,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errDescripcion,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    child: Text('Agregar Nueva Noticia'),
                    onPressed: () async {
                      await FirestoreService().noticiasAgregar(
                          tituloCtrl.text.trim(), descripcionCtrl.text.trim());
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 231, 98, 231)))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
