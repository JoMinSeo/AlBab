import 'package:albab/Constants/constants.dart';
import 'package:albab/providers/meal_search_provider.dart';
import 'package:albab/providers/school_search_provider.dart';
import 'package:albab/providers/school_select_provider.dart';
import 'package:albab/providers/swiper_provider.dart';
import 'package:albab/screen/meals/meals_page.dart';
import 'package:albab/screen/prepare/prepare_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: SchoolSearchProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SchoolSelectProvider(),
        ),
        ChangeNotifierProvider.value(
          value: MealSearchProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SwiperProvider(),
        )
      ],
      child: MaterialApp(
        title: 'AlBab',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: kBlue),
        home: Consumer<SchoolSelectProvider>(
          builder: (ctx, item, _){
            if (item.status == SelectStatus.selecting) {
              return Scaffold(body: CircularProgressIndicator());
            } else if (item.status == SelectStatus.end_selecting) {
              return MealsPage();
            }
            return PreparePage();
          },
        ),
      ),
    );
  }
}
