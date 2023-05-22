import 'package:flutter/material.dart';
import 'cadsenha.dart';
import 'package:flutter_application/Data/senha_Entity.dart';
import 'package:flutter_application/Data/senha_sqlite_datasource.dart';

class listasenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController textEditingController;

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de senhas"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              senhaSQLiteDatasource().deletePasswords();
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white, // Background color
            ),
            child: Text(
              "Excluir todos",
            ),
          )
        ],
      ),
      body: FutureBuilder<List<SenhaEntity>>(
          future: senhaSQLiteDatasource().getAllPasswords(),
        builder:
            (BuildContext context, AsyncSnapshot<List<SenhaEntity>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                SenhaEntity item = snapshot.data![index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    senhaSQLiteDatasource().deletePasswordById(item.senhaID);
                  },
                  child: ListTile(
                    title: Text(item.descricao!),
                    subtitle: Text(item.login!),
                    leading: CircleAvatar(child: Text(item.senhaID.toString())),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(item.login!),
                              content: Text(item.senha!),
                            );
                          });
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => cadsenha()));
          }),
    );
  }
}
