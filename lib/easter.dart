import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Eevee extends StatelessWidget {
  final List pokemons = [
    {
      "name": "Eevee",
      "url":
          "https://i.pinimg.com/originals/64/80/90/648090a3eedb3aff2d8bf5c0bb9e72be.jpg",
      "color": Color(0xFFc38c54),
      "text": Color(0xFFece2bb),
    },
    {
      "name": "Flareon",
      "url":
          "https://i.pinimg.com/originals/0d/75/16/0d75164c28fbd7f4b14a4617778c5bf3.jpg",
      "color": Color(0xFFcb744c),
      "text": Color(0xFFecdb8c),
    },
    {
      "name": "Sylveon",
      "url":
          "https://i.pinimg.com/originals/60/5e/81/605e816d2cb853119bd3c4cdd54065d0.jpg",
      "color": Color(0xFFfbf3f3),
      "text": Color(0xFF6c7ab0),
    },
    {
      "name": "Glaceon",
      "url":
          "https://i.pinimg.com/originals/16/19/07/1619075e9075f6369bb2f7fc96502ae8.jpg",
      "color": Color(0xFFd3e3ec),
      "text": Color(0xFF2695ba),
    },
    {
      "name": "Jolteon",
      "url":
          "https://i.pinimg.com/originals/23/9d/14/239d143920d779d9268964be32425e67.jpg",
      "color": Color(0xFFebcc5c),
      "text": Color(0xFFe6ebe5),
    },
    {
      "name": "Umbreon",
      "url":
          "https://i.pinimg.com/originals/cc/91/87/cc91879de70b1d0e8428aee0ef2fbd64.jpg",
      "color": Color(0xFF242323),
      "text": Color(0xFFce9d43),
    },
    {
      "name": "Espeon",
      "url":
          "https://i.pinimg.com/originals/47/74/a2/4774a215c5b68d1bdd3513681a2b0f8a.png",
      "color": Color(0xFFd3b3cb),
      "text": Color(0xFF6b497b),
    },
    {
      "name": "Leafeon",
      "url":
          "https://i.pinimg.com/originals/98/fb/7d/98fb7dbc5bfe16b4b2ef8854514e340e.jpg",
      "color": Color(0xFFe3db9b),
      "text": Color(0xFF6fac83),
    },
  ];

  @override
  Widget build(BuildContext context) {
    int index = Random().nextInt(pokemons.length - 1);
    var pokemon = pokemons[index];
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          actionsForegroundColor: pokemon["text"],
          backgroundColor: pokemon["color"],
          middle: Text(
            pokemon["name"],
            style: TextStyle(
              color: pokemon["text"],
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(pokemon["url"]))),
        ));
  }
}
