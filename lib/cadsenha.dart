import 'package:flutter/material.dart';
import 'package:flutter_application/Data/senha_sqlite_datasource.dart';
import 'alertdialogs.dart';

class cadsenha extends StatefulWidget {
  @override
  _cadsenhaState createState() {
    return _cadsenhaState();
  }
}

class _cadsenhaState extends State<cadsenha> {
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _loginController = TextEditingController();
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
          title: const Text('Cadastro de senhas'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black38,
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Stack(
          children: <Widget>[
            ListView(children: <Widget>[
              fieldDescricao(),
              fieldLogin(),
              fieldSenha(),
            ])
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            senhaSQLiteDatasource().insertPassword(_descricaoController.text,
                _loginController.text, _senhaController.text);
          },
          child: Icon(Icons.save_alt),
        ),
      ),
    );
  }

  Widget fieldDescricao() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _descricaoController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Informe a descrição',
        ),
      ),
    );
  }

  Widget fieldLogin() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _loginController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Login',
        ),
      ),
    );
  }

  Widget fieldSenha() {
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
}
