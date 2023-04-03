import 'package:flutter/material.dart';

import 'alertdialogs.dart';

class cadsenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          title: const Text('Cadastro de senha'),
        ),
        body: _Body());
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Form(
          child: Column(
        children: [fieldDescricao(), fieldLogin(), fieldPassword(), sendButton(context)],
      )),
    );
  }
}

Widget fieldDescricao() {
  return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Descrição')));
}

Widget fieldLogin() {
  return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Login')));
}

Widget fieldPassword() {
  return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Senha')));
}

Widget sendButton(context) {
  return Container(
      height: 50,
      width: 600,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(
        child: const Text('Cadastrar'),
        onPressed: () {
          showAlertDialog3(context);
        },
      ));
}
