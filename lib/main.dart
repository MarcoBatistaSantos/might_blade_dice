import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math';
import 'som.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Dados Might Blade';
  static const String name = "teste";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var texto = 'texto';
  int _selectedIndex = 0;
  Widget conteudo = Text('');
  var soundEfect = Som();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Dados Might Blade'),
        backgroundColor: Colors.orange[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              conteudo,
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.dice1,
              size: 60,
              color: Colors.orange,
            ),
            label: 'dice1',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.dice2,
              size: 60,
              color: Colors.orange,
            ),
            label: 'dice2',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.dice3,
              size: 60,
              color: Colors.orange,
            ),
            label: 'dice3',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

//teste
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      texto = index.toString();

      soundEfect.playLocalAsset();
      conteudo = resultado(index);
    });
  }

  Widget resultado(int valor) {
    List<Icon> lDados = [
      Icon(
        MdiIcons.dice1,
        size: 140,
        color: Colors.orange,
      ),
      Icon(
        MdiIcons.dice2,
        size: 140,
        color: Colors.orange,
      ),
      Icon(
        MdiIcons.dice3,
        size: 140,
        color: Colors.orange,
      ),
      Icon(
        MdiIcons.dice4,
        size: 140,
        color: Colors.orange,
      ),
      Icon(
        MdiIcons.dice5,
        size: 140,
        color: Colors.orange,
      ),
      Icon(
        MdiIcons.dice6,
        size: 140,
        color: Colors.orange,
      )
    ];

    valor++;
    List<int> lResult = [];

    for (var i = 0; i < valor; i++) {
      Random random = new Random();
      int randomNumber = random.nextInt(6);
      lResult.add(randomNumber);
    }

    switch (valor) {
      case 1:
        {
          var indice = lResult[0];

          if (indice == 0) {
            soundEfect.playFail();
          } else if (indice == 5) {
            soundEfect.playSuccess();
          }

          return Center(child: lDados[indice]);
        }
        break;

      case 2:
        {
          var indice = lResult[0];
          var indice2 = lResult[1];

          if (indice == 0 && indice2 == 0) {
            soundEfect.playFail();
          } else if (indice == 5 && indice2 == 5) {
            soundEfect.playSuccess();
          }

          return Row(
            children: <Widget>[
              lDados[indice],
              lDados[indice2],
            ],
          );
        }
        break;

      case 3:
        {
          var indice = lResult[0];
          var indice2 = lResult[1];
          var indice3 = lResult[2];

          if (indice == 0 && indice2 == 0 && indice3 == 0) {
            soundEfect.playFail();
          } else if (indice == 5 && indice2 == 5 && indice3 == 0) {
            soundEfect.playSuccess();
          }

          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  lDados[indice],
                ],
              ),
              Row(
                children: <Widget>[
                  lDados[indice2],
                  lDados[indice3],
                ],
              ),
            ],
          );
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
    return null;
  }
}
