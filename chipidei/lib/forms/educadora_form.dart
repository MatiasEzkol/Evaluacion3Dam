import 'package:chipidei/providers/educadora_providers.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EducadoraAgregarPage extends StatefulWidget {
  EducadoraAgregarPage({Key? key}) : super(key: key);

  @override
  State<EducadoraAgregarPage> createState() => _EducadoraAgregarPageState();
}

class _EducadoraAgregarPageState extends State<EducadoraAgregarPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidoCtrl = TextEditingController();
  TextEditingController fechaCtrl = TextEditingController();

  String errCodigo = '';
  String errNombre = '';
  String errApellido = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educadora'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(
                controller: codigoCtrl,
                decoration: InputDecoration(
                    labelText: 'Código Educadora', icon: new Icon(Icons.code)),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errCodigo,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                controller: nombreCtrl,
                decoration: InputDecoration(
                    labelText: 'Nombre Educadora',
                    icon: new Icon(MdiIcons.accountBox)),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errNombre,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                controller: nombreCtrl,
                decoration: InputDecoration(
                    labelText: 'Apellido Educadora',
                    icon: new Icon(MdiIcons.accountBox)),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errApellido,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                controller: nombreCtrl,
                decoration: InputDecoration(
                    labelText: 'Fecha de Nacimiento',
                    icon: new Icon(MdiIcons.calendar)),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Agregar Educadora'),
                  onPressed: () async {
                    var respuesta = await EducadoraProviders().educadoraAgregar(
                        codigoCtrl.text.trim(),
                        nombreCtrl.text.trim(),
                        apellidoCtrl.text.trim(),
                        fechaCtrl.text.trim());

                    if (respuesta['message'] != null) {
                      //cod
                      if (respuesta['errors']['cod_educadora'] != null) {
                        errCodigo = respuesta['errors']['cod_educadora'][0];
                      }
                      //nombre
                      if (respuesta['errors']['nombre_educadora'] != null) {
                        errNombre = respuesta['errors']['nombre_educadora'][0];
                      }
                      //apellido
                      if (respuesta['errors']['apellido_educadora'] != null) {
                        errApellido =
                            respuesta['errors']['apellido_educadora'][0];
                      }
                      setState(() {});
                      return;
                    }
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
