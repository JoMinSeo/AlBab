import 'package:albab/screen/meals/meals_body.dart';
import 'package:flutter/material.dart';
import 'package:albab/services/sizes/sizeconfig.dart';

class MealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: MealsBody(),
    );
  }
}
