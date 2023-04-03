import 'package:flutter/material.dart';
import 'package:flutter_application/login.dart';

class cadcartao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: Text('Cadastro de cartões'),
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[300],
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget fieldDescricao() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'Descrição'),
    ),
  );
}

Widget fieldSenha() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: TextFormField(
        obscureText: true,
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: 'Senha')),
  );
}

Widget fieldNumero() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'Numero'),
    ),
  );
}

Widget fieldValidade() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'Validade'),
    ),
  );
}

Widget fieldCvv() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'CVV'),
    ),
  );
}

Widget ContainerPreto() {
  return (Container(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Container(
      height: 40,
      color: Colors.black,
    ),
  ));
}

Widget ContainerCinza() {
  return (Container(
    child: Container(
      height: 50,
      color: Colors.black,
    ),
  ));
}

Widget textNome() {
  return Text(
    "Karoline B Wessler",
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    textAlign: TextAlign.right,
  );
}

Widget CartaoFrente(context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [cartaoFront(context)],
      ));
}

Widget cartaoFront(context) {
  return Container(
    width: MediaQuery.of(context).size.width * .9,
    height: 200,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 16, 121, 22)),
    child: Column(
      children: [fieldNumero(), fieldValidade(), textNome()],
    ),
  );
}

Widget CartaoVerso(context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [cartaoVerse(context)],
      ));
}

Widget cartaoVerse(context) {
  return Container(
    width: MediaQuery.of(context).size.width * .9,
    height: 200,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 255, 193, 7)),
    child: Column(
      children: [ContainerPreto(), ContainerCinza(), fieldCvv()],
    ),
  );
}

class Body extends StatelessWidget {
  bool mostraSenha = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        fieldDescricao(),
        SizedBox(
          height: 10,
        ),
        CartaoFrente(context),
        SizedBox(
          height: 20,
        ),
        CartaoVerso(context),
        SizedBox(
          height: 10,
        ),
        fieldSenha(),
      ],
    );
  }
}