import 'package:flutter/material.dart';

void showSnackBar(String mensaje,BuildContext contexto) {
    ScaffoldMessenger.of(contexto).showSnackBar(SnackBar(
      content: Text(mensaje),
      duration: Duration(seconds: 2),
    ));
  }