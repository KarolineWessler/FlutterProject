import 'package:flutter/material.dart';
import 'package:flutter_application/alertdialogs.dart';
import 'package:flutter_application/senhas.dart';
import 'package:flutter_application/perfildousuario.dart';
import 'package:flutter_application/Data/perfil_sqlite_datasource.dart';

import 'listacartoes.dart';

class login extends StatefulWidget {
  final String email;
  const login({Key? key, required this.email}) : super(key: key);

  @override
  _login createState() {
    return _login();
  }
}

class _login extends State<login> {
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
              accountEmail: Text(widget.email),
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
                leading: Icon(Icons.lock),
                title: Text("Senhas"),
                subtitle: Text("Gerenciador de senhas"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return senhas();
                  }));
                }),
            ListTile(
                leading: Icon(Icons.credit_card),
                title: Text("Cartões"),
                subtitle: Text("Gerenciador de cartões"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return listacartoes();
                  }));
                }),
          ],
        ),
      ),
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(),
          child: Text('Sair'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

Future<String> getNome(email) async {
  return Future.value(perfilSQLiteDatasource().getPerfilLogado(email));
}
