import 'package:flutter/material.dart';

Future<dynamic> confirmDialog(BuildContext context, String table, String data) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirma borrado'),
            content: Text('Seguro que quiere borrar a $table $data?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('Cancelar')),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text('Aceptar'))
            ],
          );
        });
  }