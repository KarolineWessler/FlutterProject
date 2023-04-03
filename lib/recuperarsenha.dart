import 'package:flutter/material.dart';

import 'alertdialogs.dart';
import 'cadastro.dart';
import 'login.dart';

class recuperarsenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: const Text('Recuperação de senha'),
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
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/passwordrecovery.png',
                height: 220,
                width: 220,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text("Esqueceu sua senha",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text("Informe o e-mail associado a sua conta para recuperar a sua senha",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
              )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'E-mail'),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Enviar'),
                  onPressed: () {
                    showAlertDialog1(context);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
