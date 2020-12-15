import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Controle Financeiro"),
      ),
      body: _body(),
    );
  }

  _body() {
    Center(
      child: Text(
        "Controle Financeiro",
        style: TextStyle(
          fontSize: 23,
        ),
      ),
    );
  }
}
