import 'package:chipidei/providers/nivel_providers.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NivelAgregarPage extends StatefulWidget {
  NivelAgregarPage({Key? key}) : super(key: key);

  @override
  State<NivelAgregarPage> createState() => _NivelAgregarPageState();
}

class _NivelAgregarPageState extends State<NivelAgregarPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController nombreCtrl = TextEditingController();

  String errCodigo = '';
  String errNombre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nivel'),
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
                    labelText: 'Código Nivel', icon: new Icon(Icons.code)),
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
                    labelText: 'Nombre del nivel',
                    icon: new Icon(MdiIcons.accountBox)),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errNombre,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Agregar Nivel Deseado'),
                  onPressed: () async {
                    var respuesta = await NivelProviders().nivelAgregar(
                      codigoCtrl.text.trim(),
                      nombreCtrl.text.trim(),
                    );

                    if (respuesta['message'] != null) {
                      //cod
                      if (respuesta['errors']['cod_nivel'] != null) {
                        errCodigo = respuesta['errors']['cod_nivel'][0];
                      }
                      //descripcion
                      if (respuesta['errors']['nom_nivel'] != null) {
                        errNombre = respuesta['errors']['nom_nivel'][0];
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
