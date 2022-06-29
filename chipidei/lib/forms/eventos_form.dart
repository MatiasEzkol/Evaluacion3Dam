import 'package:chipidei/providers/eventos_providers.dart';
import 'package:flutter/material.dart';

class EventoAgregarPage extends StatefulWidget {
  EventoAgregarPage({Key? key}) : super(key: key);

  @override
  State<EventoAgregarPage> createState() => _EventoAgregarPageState();
}

class _EventoAgregarPageState extends State<EventoAgregarPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController codigoCtrl = TextEditingController();
  TextEditingController descripcionCtrl = TextEditingController();
  TextEditingController fechaCtrl = TextEditingController();

  String errCodigo = '';
  String errDescripcion = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Evento'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(
                controller: codigoCtrl,
                decoration: InputDecoration(labelText: 'Código Evento'),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  errCodigo,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextFormField(
                controller: descripcionCtrl,
                decoration: InputDecoration(
                    labelText: 'Descripcion del evento sucedido'),
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
                  child: Text('Agregar Historial de Evento'),
                  onPressed: () async {
                    var respuesta = await EventosProviders().eventoAgregar(
                        codigoCtrl.text.trim(),
                        descripcionCtrl.text.trim(),
                        fechaCtrl.text.trim());

                    if (respuesta['message'] != null) {
                      //cod
                      if (respuesta['errors']['cod_evento'] != null) {
                        errCodigo = respuesta['errors']['cod_evento'][0];
                      }
                      //descripcion
                      if (respuesta['errors']['descripcion'] != null) {
                        errDescripcion = respuesta['errors']['descripcion'][0];
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
