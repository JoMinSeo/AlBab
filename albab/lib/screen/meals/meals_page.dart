import 'package:albab/Constants/constants.dart';
import 'package:albab/components/floating_menu.dart';
import 'package:albab/screen/meals/meals_body.dart';
import 'package:flutter/material.dart';
import 'package:albab/services/sizes/sizeconfig.dart';

class MealsPage extends StatefulWidget {
  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: MealsBody(),
      floatingActionButton: FloatingMenu(),
    );
  }
}
