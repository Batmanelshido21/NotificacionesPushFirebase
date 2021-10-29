import 'package:flutter/material.dart';

class PantallaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla principal'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Centro de la pantalla'),
      ),
    );
  }
}
