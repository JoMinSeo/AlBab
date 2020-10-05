import 'package:albab/Constants/constants.dart';
import 'package:albab/components/floating_menu.dart';
import 'package:albab/providers/meal_search_provider.dart';
import 'package:albab/providers/school_select_provider.dart';
import 'package:albab/screen/meals/meals_body.dart';
import 'package:flutter/material.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:provider/provider.dart';

class MealsPage extends StatefulWidget {
  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final provider = Provider.of<SchoolSelectProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MealSearchProvider>(context, listen: false)
          .mealSearch(provider.schoolDataModel.school_id, provider.schoolDataModel.office_code, DateTime.now());
    });

    return Scaffold(
      body: SafeArea(child: MealsBody()),
      floatingActionButton: FloatingMenu(),
    );
  }
}
