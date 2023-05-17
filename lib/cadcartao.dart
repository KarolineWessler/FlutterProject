import 'package:flutter/material.dart';
import 'package:flutter_application/login.dart';
import 'package:flutter_application/Data/cartao_sqlite_datasource.dart';

class cadcartao extends StatefulWidget {
  @override
  _cadcartaoState createState() {
    return _cadcartaoState();
  }
}

class _cadcartaoState extends State<cadcartao> {
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _numeroCartaoController = TextEditingController();
  TextEditingController _validadeController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  bool _ocultaSenha = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro cartões'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black38,
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: ListView(
          children: <Widget>[
            fieldDescricao(),
            SizedBox(
              height: 20,
            ),
            CartaoFrente(context),
            SizedBox(
              height: 20,
            ),
            CartaoAtras(context),
            SizedBox(
              height: 05,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            cartaoSQLiteDatasource().inserirCartao(
                _descricaoController.text,
                _numeroCartaoController.text,
                _validadeController.text,
                _cvvController.text,
                _senhaController.text);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget fieldNumero() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _numeroCartaoController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Número',
        ),
      ),
    );
  }

  Widget fieldValidade() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _validadeController,
        keyboardType: TextInputType.datetime,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Validade',
        ),
      ),
    );
  }

  Widget fieldCvv() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _cvvController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'CVV',
        ),
      ),
    );
  }

  Widget fieldDescricao() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: TextField(
        controller: _descricaoController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Descrição',
        ),
      ),
    );
  }

  Widget fieldSenha() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _senhaController,
        obscureText: _ocultaSenha,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "Senha",
          helperText: "Digite uma senha para sua segurança",
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

  Widget textNome() {
    return Expanded(
        child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              'Karoline B Wessler',
              style: TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            )));
  }

  Widget CartaoFrente(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [cartaoFront(context)],
      ),
    );
  }

  Widget cartaoFront(context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 300,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 16, 121, 22)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [fieldNumero(), fieldValidade(), fieldSenha(), textNome()],
      ),
    );
  }

  Widget CartaoAtras(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [cartaoBack(context)],
      ),
    );
  }

  Widget cartaoBack(context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.amber),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(height: 40, color: Colors.black),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            color: Colors.grey,
          ),
          fieldCvv(),
        ],
      ),
    );
  }
}
