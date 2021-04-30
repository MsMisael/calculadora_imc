import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.indigo,
        backgroundColor: Colors.white,
        accentColor: Colors.indigoAccent,
      ),
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
