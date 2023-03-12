import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../widgets/logo_widget.dart';
import '../widgets/submit_form.dart';
import '../widgets/sucesso_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.lightBlue;

  var _controladorGas = new MoneyMaskedTextController();

  var _controladorAlc = new MoneyMaskedTextController();

  var _busy = false;

  var _complete = false;

  var _resultText = "Compensa usar...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1300,
        ),
        color: _color,
        child: ListView(
          children: <Widget>[
            Logo(),
            _complete
                ? Sucesso(
                    result: _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    controladorAlc: _controladorAlc,
                    controladorGas: _controladorGas,
                    busy: _busy,
                    submitFunc: calculate,
                  ),
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alc = double.parse(_controladorAlc.text.replaceAll(',', '.')) / 100;
    double gas = double.parse(_controladorGas.text.replaceAll(',', '.')) / 100;

    double res = alc / gas;

    setState(() {
      _color = Color.fromARGB(255, 4, 102, 151);
      _complete = false;
      _busy = true;
    });

    return new Future.delayed(
        const Duration(seconds: 1),
        () => {
              setState(() {
                if (res >= 0.7) {
                  _resultText = "Compensa Abastecer Gasolina";
                } else {
                  _resultText = "Compensa Abastecer Álcool";
                }

                _busy = false;
                _complete = true;
              })
            });
  }

  reset() {
    setState(() {
      _controladorAlc = new MoneyMaskedTextController();
      _controladorGas = new MoneyMaskedTextController();
      _complete = false;
      _busy = false;
      _color = Colors.lightBlue;
    });
  }
}
