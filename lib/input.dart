import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PalindromoInput extends StatefulWidget {
  PalindromoInput({Key key, this.esPalindromo, this.word}) : super(key: key);

  final ValueSetter<bool> esPalindromo;
  final ValueSetter<String> word;

  @override
  _PalindromoInputState createState() => _PalindromoInputState();
}

class _PalindromoInputState extends State<PalindromoInput> {
  TextEditingController controller;

  bool palindromo(String text) {
    bool response = true;
    if (text.length <= 0) {
      response = false;
    } else if (text.length == 1) {
      response = true;
    } else {
      String reversed = text.split("").reversed.join();
      for (var i = 0; i < text.length; i++) {
        if (reversed[i] != text[i]) {
          response = false;
        }
      }
    }

    return response;
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: "");
    controller.addListener(() {
      widget.word(controller.text);
      bool res = palindromo(controller.text);
      widget.esPalindromo(res);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(40),
        child: CupertinoTextField(
          controller: controller,

          // decoration: InputDecoration(
          //     contentPadding: EdgeInsets.all(10),
          //     fillColor: Colors.amber,
          //     // border: InputBorder.none,
          //     hintText: 'Ingrese una palabra para saber si es palindromo'),
        ));
  }
}
