import 'package:chipidei/providers/nino_providers.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NinoAgregarPage extends StatefulWidget {
  NinoAgregarPage({Key? key}) : super(key: key);

  @override
  State<NinoAgregarPage> createState() => _NinoAgregarPageState();
}

class _NinoAgregarPageState extends State<NinoAgregarPage> {
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
        title: Text('Crear Perfil de Niño'),
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
                    labelText: 'Código Niño', icon: new Icon(Icons.code)),
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
                    labelText: 'Nombre Niño', icon: new Icon(Icons.boy)),
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
                    labelText: 'Apellido Niño', icon: new Icon(Icons.boy)),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errApellido,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Fecha de Nacimiento',
                  //suffixIcon:
                  //icon: new Icon(MdiIcons.calendar)
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Agregar Perfil de Niño'),
                  onPressed: () async {
                    var respuesta = await NinoProviders().ninoAgregar(
                        codigoCtrl.text.trim(),
                        nombreCtrl.text.trim(),
                        apellidoCtrl.text.trim(),
                        fechaCtrl.text.trim());

                    if (respuesta['message'] != null) {
                      //cod
                      if (respuesta['errors']['cod_nino'] != null) {
                        errCodigo = respuesta['errors']['cod_nino'][0];
                      }
                      //nombre
                      if (respuesta['errors']['nom_nino'] != null) {
                        errNombre = respuesta['errors']['nom_nino'][0];
                      }
                      //apellido
                      if (respuesta['errors']['apell_nino'] != null) {
                        errApellido = respuesta['errors']['apell_nino'][0];
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
