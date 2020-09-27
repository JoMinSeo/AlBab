import 'package:albab/components/menu_tile.dart';
import 'package:albab/model/meal_model.dart';
import 'package:albab/providers/meal_search_provider.dart';
import 'package:albab/services/sizes/sizeconfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealSearchProvider>(context);

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        width: getProportionateScreenWidth(5),
      ),
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      // itemCount: mealProvider.mealModel.data.meal_menu.length == null ? 0 : mealProvider.mealModel.data.meal_menu.length,
      itemBuilder: (context, index) {
        return MenuTile(
          icon: iconSelect(index),
          title: titleSelect(index),
          content: mealProvider.mealModel.data.meal_menu[index].isEmpty
              ? null
              : mealProvider.mealModel.data.meal_menu[index],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // futureMeal = mealData();
  }
}

IconData iconSelect(int index) {
  if (index == 0) {
    return Icons.wb_sunny;
  } else if (index == 1) {
    return Icons.wb_cloudy;
  } else if (index == 2) {
    return Icons.lightbulb_outline;
  }
}

String titleSelect(int index) {
  if (index == 0) {
    return "아침";
  } else if (index == 1) {
    return "점심";
  } else if (index == 2) {
    return "저녁";
  }
}
