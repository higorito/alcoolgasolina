import 'package:flutter/material.dart';

import 'loading_button.dart';

// ignore: must_be_immutable
class Sucesso extends StatelessWidget {
  var result = "";
  VoidCallback reset;

  Sucesso({super.key, required this.result, required this.reset});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 30,
              fontFamily: "HEINEKEN.TTF",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          LoadingButton(
            busy: false,
            invert: true,
            func: reset,
            text: "CALCULAR NOVAMENTE",
          )
        ],
      ),
    );
  }
}
