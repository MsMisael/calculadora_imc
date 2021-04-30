import 'package:flutter/material.dart';

import 'input_text_widget.dart';

class FormWidget extends StatelessWidget {
  const FormWidget(
      {Key key,
      @required GlobalKey<FormState> formKey,
      @required this.weightController,
      @required this.heightController,
      @required String infoText,
      @required Function this.calculate})
      : _formKey = formKey,
        _infoText = infoText,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController weightController;
  final TextEditingController heightController;
  final String _infoText;
  final Function calculate;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.person,
              size: 120,
              color: Theme.of(context).primaryColor,
            ),
            InputTextWidget(
              controller: weightController,
              errorText: "Insira um peso valido",
              labelText: "Peso (kg)",
            ),
            InputTextWidget(
              controller: heightController,
              errorText: "Insira uma altura Valida",
              labelText: "Peso (cm)",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: this.calculate,
                  child: Text(
                    "Calcular!",
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontSize: 25.0),
                  ),
                  color: Theme.of(context).primaryColor,
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
    );
  }
}
