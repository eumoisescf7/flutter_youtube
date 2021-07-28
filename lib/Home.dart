import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'telas/Inicio.dart';
import 'telas/Inscricao.dart';
import 'telas/Biblioteca.dart';
import 'telas/EmAlta.dart';
import 'CustomSearchDelegate.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {


    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          //opacity: 1
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "images/youtube.png",
            width: 98,
            height: 22,
        ),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());

              setState(() {
                _resultado = res;
              });

              print ("resultado: " + res);
              },
          ),

          /*IconButton(
              icon: Icon(Icons.videocam),
              onPressed: (){
                print("ação: videocam");
              },
          ),

          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("ação: conta");
            },
          ),*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.shifting, //mais de tres navigationBar
        type: BottomNavigationBarType.fixed, //até três navigationBar
        fixedColor: Colors.red,
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        items: [
          BottomNavigationBarItem(
              //backgroundColor: Colors.orange,
              title: Text("Inicio"),
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              //backgroundColor: Colors.red,
              title: Text("Em alta"),
              icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
              //backgroundColor: Colors.blue,
              title: Text("Inscrições"),
              icon: Icon(Icons.movie)
          ),
          BottomNavigationBarItem(
              //backgroundColor: Colors.green,
              title: Text("Biblioteca"),
              icon: Icon(Icons.folder)
          ),
        ]
      ),
    );
  }
}
