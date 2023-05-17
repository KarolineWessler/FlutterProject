import 'package:flutter/material.dart';
import 'package:flutter_application/cadcartao.dart';
import 'package:flutter_application/listasenha.dart';
import 'cadsenha.dart';
import 'gerarsenha.dart';

class senhas extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<senhas> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    listasenha(),
    gerarsenha(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.key), label: "Senhas"),
          BottomNavigationBarItem(
              icon: Icon(Icons.password), label: "Gerar senha"),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
