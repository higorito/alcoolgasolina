import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  var busy = false;
  var invert = false;
  VoidCallback func;
  var text = "";

  LoadingButton(
      {required this.busy,
      required this.invert,
      required this.func,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            height: 60,
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: invert
                    ? Theme.of(context).primaryColor
                    : Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(60)),
            child: TextButton(
              child: Text(
                text,
                style: TextStyle(
                  color: invert ? Colors.white : Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontFamily: "HEINEKEN.TTF",
                ),
                textAlign: TextAlign.center,
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
              ),
              onPressed: func,
            ),
          );
  }
}
