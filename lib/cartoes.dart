import 'package:flutter/material.dart';
import 'package:flutter_application/cadcartao.dart';
import 'cadsenha.dart';
import 'gerarsenha.dart';

class cartoes extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<cartoes> {
  int _indiceAtual = 0; 
  final List<Widget> _telas = [
    gerarsenha(),
    cadsenha(),
    cadcartao()
  ];
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
				currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Gerar senha"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.password),
              label: "Cadastrar senha"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: "Cadastrar cartões"
          ),
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


 
