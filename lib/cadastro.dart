import 'package:flutter/material.dart';

import 'alertdialogs.dart';

class cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text('Cadastro de usuário'),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.all(100),
      child: Form(
          child: Column(
        children: [
          header(),
          fieldName(),
          fieldEmail(),
          fieldPassword(),
          saveButton(context),
        ],
      )),
    ));
  }
}

Widget header() {
  return Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        "Informe seus dados",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ));
}

Widget fieldName() {
  return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Nome')));
}

Widget fieldEmail() {
  return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'E-mail')));
}

Widget fieldPassword() {
  return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Senha')));
}

Widget saveButton(context) {
  return Container(
      height: 50,
      width: 500,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
        child: const Text('Cadastrar'),
        onPressed: () {
          showAlertDialog2(context);
        },
      ));
}
