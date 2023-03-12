import 'package:alcoolgasolina/widgets/input_widget.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'loading_button.dart';

// ignore: must_be_immutable
class SubmitForm extends StatelessWidget {
  var controladorGas = new MoneyMaskedTextController();
  var controladorAlc = new MoneyMaskedTextController();

  var busy = false;
  VoidCallback submitFunc;

  SubmitForm(
      {required this.controladorAlc,
      required this.controladorGas,
      required this.busy,
      required this.submitFunc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: "Gasolina",
            controlador: controladorGas,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: "Álcool",
            controlador: controladorAlc,
          ),
        ),
        LoadingButton(
          busy: busy,
          invert: false,
          func: submitFunc,
          text: "CALCULAR",
        )
      ],
    );
  }
}
