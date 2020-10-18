import 'package:flutter/material.dart';
import 'package:calc_bhaskara/screen/bhaskara.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calc Bhaskara',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Bhaskara(),
    );
  }
}
