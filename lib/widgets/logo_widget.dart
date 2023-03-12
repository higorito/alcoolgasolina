import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Image.asset(
          "assets/images/iconAbastecer.png",
          height: 140,
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "Álcool ou Gasolina?",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontFamily: "HEINEKEN.TTF",
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
