import 'package:flutter/material.dart';
import 'package:flutter_application/alertdialogs.dart';
import 'package:flutter_application/cartoes.dart';
import 'package:flutter_application/perfildousuario.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            // ignore: prefer_const_constructors
            UserAccountsDrawerHeader(
              accountName: Text("Karolis"),
              accountEmail: Text("Karolis@gmail.com"),
              // ignore: prefer_const_constructors
              currentAccountPicture: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/images/perfil.jpg'),
                backgroundColor: Colors.black,
              ),
            ),
            ListTile(
                leading: Icon(Icons.star),
                title: Text("Favoritos"),
                subtitle: Text("Meus favoritos"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  showAlertDialog4(context);
                }),
            ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Perfil"),
                subtitle: Text("Perfil do usuário"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return perfildousuario();
                  }));
                }),
            ListTile(
                leading: Icon(Icons.credit_card),
                title: Text("Cartões"),
                subtitle: Text("Meus cartões"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return cartoes();
                  }));
                }),
          ],
        ),
      ),
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(),
          child: Text('Voltar'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
