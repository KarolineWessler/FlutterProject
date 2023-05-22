import 'package:flutter/material.dart';

import 'Data/perfil_sqlite_datasource.dart';
import 'alertdialogs.dart';

class cadastro extends StatefulWidget {
  @override
  _cadastroState createState() {
    return _cadastroState();
  }
}

class _cadastroState extends State<cadastro> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  bool _ocultaSenha = false;

  @override
  void initState() {
    super.initState();
    _ocultaSenha = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[300],
          title: Text('Cadastro de usuário'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black38,
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              child: Column(
                children: [
                  header(),
                  fieldName(),
                  fieldEmail(),
                  fieldPassword(),
                  saveButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
            controller: _nomeController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Nome')));
  }

  Widget fieldEmail() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: _emailController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'E-mail')));
  }

  Widget fieldPassword() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _senhaController,
        keyboardType: TextInputType.text,
        obscureText: _ocultaSenha,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Senha",
          helperText: "Digite uma senha",
          helperStyle: TextStyle(color: Colors.green),
          suffixIcon: IconButton(
            icon: Icon(_ocultaSenha ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(
                () {
                  _ocultaSenha = !_ocultaSenha;
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget saveButton() {
    return Container(
        height: 50,
        width: 500,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
          child: const Text('Cadastrar'),
          onPressed: () {
            perfilSQLiteDatasource().insertProfile(_nomeController.text,
                _emailController.text, _senhaController.text);
          },
        ));
  }
}

