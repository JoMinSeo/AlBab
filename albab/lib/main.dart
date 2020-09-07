import 'package:albab/screen/meals/meals_page.dart';
import 'package:albab/screen/prepare/prepare_body.dart';
import 'package:albab/screen/prepare/prepare_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlBab',
      theme: ThemeData(
        primaryColor: Color(0xFF067302)
      ),
      home: PreparePage(),
    );
  }
}

