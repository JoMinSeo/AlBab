import 'package:albab/model/meal_model.dart';
import 'package:albab/model/search_model.dart';
import 'package:albab/services/network/meal_data.dart';
import 'package:flutter/cupertino.dart';

enum MealStatus { food_searching,
  end_food_searching,
  error_food_searching, }

final dateData = {};

class MealSearchProvider extends ChangeNotifier{
  MealStatus _status = MealStatus.food_searching;
  DateTime _time = DateTime.now();
  MealModel mealModel = MealModel.empty;

  MealStatus get status => _status;

  set status(MealStatus val) {
    _status = val;
    notifyListeners();
  }

  DateTime get time => _time;
  set time(val) {
    _time = val;
    notifyListeners();
  }

  Future<void> mealSearch(String schoolId, String officeCode) async{
    print(time);
    status = MealStatus.food_searching;
    final format =
        "$schoolId$officeCode${time.year}${time.month}${time.day}";
    if (dateData[format] != null) {
      mealModel = dateData[format];
      status = MealStatus.end_food_searching;
      return;
    }

    final response = await mealData(schoolId, officeCode, time);
    print(response);
    if(response.status == 200){
      mealModel = response;
      status = MealStatus.end_food_searching;
      return;
    }
    status = MealStatus.error_food_searching;
    return;
  }
}