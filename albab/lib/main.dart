import 'package:albab/providers/screenChange.dart';
import 'package:albab/screen/prepare/prepare_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ScreenChange()),
      ],
      child: MaterialApp(
        title: 'AlBab',
        theme: ThemeData(primaryColor: Color(0xFF067302)),
        home: PreparePage(),
      ),
    );
  }
}
