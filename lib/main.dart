import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palindromo/easter.dart';
import 'package:palindromo/input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Palindromo',
      home: MyHomePage(title: 'Palindromo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool esPalindromo = false;
  String word = "";
  bool animated = false;
  bool eevee = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.orange,
        middle: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Ingresa una palabra para saber si es palindromo",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.orange,
                fontSize: 32,
                fontWeight: FontWeight.w600),
          ),
          PalindromoInput(
            esPalindromo: (bool pal) {
              setState(() {
                esPalindromo = pal;
              });
              print(esPalindromo);
            },
            word: (String val) {
              setState(() {
                word = val;
                animated = true;
              });

              Timer(Duration(milliseconds: 100), () {
                setState(() {
                  animated = false;
                });
              });
            },
          ),
          AnimatedDefaultTextStyle(
            child: Text(
              word,
              textAlign: TextAlign.center,
            ),
            style: animated
                ? TextStyle(
                    fontFamily: "Horizon",
                    color: Colors.blue,
                    fontSize: 48,
                  )
                : TextStyle(
                    color: Colors.grey,
                    fontSize: 24,
                  ),
            duration: Duration(milliseconds: 200),
          ),
          AnimatedDefaultTextStyle(
            child: Text(
              "${word == "" ? "Ingresa una palabra" : esPalindromo ? "Es palindromo" : "No es palindromo"}",
              textAlign: TextAlign.center,
            ),
            style: word == ""
                ? TextStyle(
                    fontFamily: "Horizon",
                    color: Colors.blue,
                    fontSize: 24,
                  )
                : esPalindromo
                    ? TextStyle(
                        fontFamily: "Horizon",
                        color: Colors.green,
                        fontSize: 48,
                      )
                    : TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                      ),
            duration: Duration(milliseconds: 200),
          ),
          word == "eevee"
              ? GestureDetector(
                  onTap: () => Navigator.of(context, rootNavigator: true)
                      .push(CupertinoPageRoute(
                    builder: (context) => Eevee(),
                  )),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.network(
                        "https://pngimg.com/uploads/pokeball/pokeball_PNG27.png"),
                  ),
                )
              : Container(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "Made by @noeosorioh",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
