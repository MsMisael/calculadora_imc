import 'package:flutter/material.dart';

import 'widgets/form_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infoText = "infome seus dados";
  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = "infome seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _calculate() {
    if (!_formKey.currentState.validate()) return;
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;

    setState(() {
      double imc = weight / (height * height);
      debugPrint("$imc");
      if (imc < 18.6) {
        _infoText = "Imc Abaixo do Ideal ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Imc Ideal ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText =
            "Imc Levemente acima do Ideal ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Imc de Obesidade Grau I ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Imc de Obesidade Grau II ${imc.toStringAsPrecision(4)}";
      } else if (imc >= 40.0) {
        _infoText = "Imc de Obesidade Grau III ${imc.toStringAsPrecision(4)}";
      }
    });
  }

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de imc"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: FormWidget(
        formKey: _formKey,
        weightController: weightController,
        heightController: heightController,
        infoText: _infoText,
        calculate: _calculate,
      ),
    );
  }
}
