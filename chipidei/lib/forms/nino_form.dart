import 'package:chipidei/providers/nino_providers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NinoAgregarPage extends StatefulWidget {
  NinoAgregarPage({Key? key}) : super(key: key);

  @override
  State<NinoAgregarPage> createState() => _NinoAgregarPageState();
}

class _NinoAgregarPageState extends State<NinoAgregarPage> {
  final formKey = GlobalKey<FormState>();
  DateTime fechaNacimiento = DateTime.now();
  DateTime fechaAdmision = DateTime.now();
  var ffecha = DateFormat('dd-MM-yyyy');

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
        backgroundColor: Color.fromARGB(255, 231, 98, 231),
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
              campoFechaNacimiento(context),
              campoFechaAdmision(context),
              //TODO: IMG

              TextFormField(
                controller: nombreCtrl,
                decoration: InputDecoration(labelText: '👨 Nombre del Padre'),
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
                  labelText: '👩 Nombre de la Madre ',
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errNombre,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '📞Telefono de Contacto',
                  //icon: new Icon(MdiIcons.phone)
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

  Row campoFechaNacimiento(BuildContext context) {
    return Row(
      children: [
        Text('Fecha de nacimiento:', style: TextStyle(fontSize: 16)),
        Text(ffecha.format(fechaNacimiento),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Spacer(),
        TextButton(
          child: Icon(MdiIcons.calendar),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1920),
              lastDate: DateTime.now(),
              locale: Locale('es', 'ES'),
            ).then((fecha) {
              setState(() {
                // fechaSeleccionada = fecha != null ? fecha : fechaSeleccionada;
                fechaNacimiento = fecha ?? fechaNacimiento;
              });
            });
          },
        ),
      ],
    );
  }

  Row campoFechaAdmision(BuildContext context) {
    return Row(
      children: [
        Text('Fecha de admision:', style: TextStyle(fontSize: 16)),
        Text(ffecha.format(fechaAdmision),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Spacer(),
        TextButton(
          child: Icon(MdiIcons.calendar),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1920),
              lastDate: DateTime.now(),
              locale: Locale('es', 'ES'),
            ).then((fecha) {
              setState(() {
                // fechaSeleccionada = fecha != null ? fecha : fechaSeleccionada;
                fechaAdmision = fecha ?? fechaAdmision;
              });
            });
          },
        ),
      ],
    );
  }
}
