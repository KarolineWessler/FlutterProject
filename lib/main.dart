import 'package:flutter/material.dart';
import 'package:flutter_application/cadastro.dart';
import 'package:flutter_application/recuperarsenha.dart';
import 'package:flutter_application/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: _Login(),
        ));
  }
}

class _Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(100),
        child: ListView(
          children: <Widget>[
            Container(
              child: Image.asset(
                'assets/images/loginusuario.png',
                height: 220,
                width: 220,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'E-mail'),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return recuperarsenha();
                    }));
                  },
                  child: const Text('Esqueci minha senha')),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return login();
                    }));
                  },
                )),
            Row(
              // ignore: sort_child_properties_last
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: const Text('Não possui conta?'),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: TextButton(
                    child: const Text(
                      'Cadastre aqui',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return cadastro();
                      }));
                    },
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
