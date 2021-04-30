import 'package:flutter/material.dart';

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
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                Icons.person,
                size: 120,
              ),
              TextFormField(
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira um Peso valido.";
                  }
                },
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso em kg",
                  labelStyle: TextStyle(),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
              ),
              TextFormField(
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira uma Altura valida.";
                  }
                },
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura em cm",
                  labelStyle: TextStyle(),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: _calculate,
                    child: Text(
                      "Calcular!",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
