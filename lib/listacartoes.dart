import 'package:flutter/material.dart';
import 'cadcartao.dart';
import 'Data/cartao_Entity.dart';
import 'package:flutter_application/Data/cartao_sqlite_datasource.dart';

class listacartoes extends StatelessWidget {
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
        title: Text("Lista de cartões"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              cartaoSQLiteDatasource().deleteAllCards();
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white, // Back// Background color
            ),
            child: Text(
              "Excluir todos",
            ),
          )
        ],
      ),
      body: FutureBuilder<List<CartaoEntity>>(
        future: cartaoSQLiteDatasource().getAllCards(),
        builder:
            (BuildContext context, AsyncSnapshot<List<CartaoEntity>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                CartaoEntity item = snapshot.data![index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.green),
                  onDismissed: (direction) {
                    cartaoSQLiteDatasource().deleteCard(item.cartaoID);
                  },
                  child: ListTile(
                    title: Text(item.descricao!),
                    subtitle: Text(item.numero!),
                    leading:
                        CircleAvatar(child: Text(item.cartaoID.toString())),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(item.numero!),
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
                .push(MaterialPageRoute(builder: (context) => cadcartao()));
          }),
    );
  }
}
