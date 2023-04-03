import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application/login.dart';

class gerarsenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return login();
            }));
          },
        ),
        title: Text('Gerador de senhas'),
      ),
      body: _Body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        onPressed: () {},
        child: Icon(Icons.email),
      ),
    );
  }
}

Widget textMaior() {
  return Text(
    "Gerador de senhas",
    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
    textAlign: TextAlign.center,
  );
}

Widget textMenor() {
  return Text(
    "Como deseja gerar sua senha",
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    textAlign: TextAlign.center,
  );
}

Widget fieldEmail() {
  return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: "Email"));
}

Widget sizedBox() {
  return Container(
    child: Image.asset(
      'assets/images/passwordrecovery.png',
      height: 220,
      width: 220,
    ),
  );
}

Widget CheckBoxSelecao() {
  var _aazselected = false;
  var _zeroanoveselected = false;
  var _arrobajogoselected = false;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Checkbox(
        value: _aazselected,
        onChanged: (value) {
          _aazselected = true;
        },
      ),
      Text('[A-Z]'),
      Checkbox(
        value: _zeroanoveselected,
        onChanged: (value) {
          _zeroanoveselected = true;
        },
      ),
      Text('[0-9]'),
      Checkbox(
        value: _arrobajogoselected,
        onChanged: (value) {
          _arrobajogoselected = true;
        },
      ),
      Text('[@-#]'),
    ],
  );
}

Widget AddRange() {
  double _currentSliderValue = 1;
  return Slider(
    value: 0,
    max: 100,
    divisions: 1,
    label: _currentSliderValue.round().toString(),
    onChanged: (double value) {},
  );
}

Widget gerarSenha() {
  return Container(
      height: 50,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child:
          ElevatedButton(child: const Text('Gerar Senha'), onPressed: () {}));
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        child: ListView(
          children: [
            sizedBox(),
            textMaior(),
            textMenor(),
            SizedBox(
              height: 20,
            ),
            fieldEmail(),
            SizedBox(
              height: 20,
            ),
            CheckBoxSelecao(),
            SizedBox(
              height: 20,
            ),
            AddRange(),
            SizedBox(
              height: 20,
            ),
            gerarSenha(),
          ],
        ));
  }
}
