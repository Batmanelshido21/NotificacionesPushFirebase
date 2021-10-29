import 'package:flutter/material.dart';

class PantallaMensaje extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de mensajes'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Centro de la pantalla'),
      ),
    );
  }
}
