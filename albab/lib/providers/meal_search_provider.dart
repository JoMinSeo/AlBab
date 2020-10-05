import 'package:albab/model/meal_model.dart';
import 'package:albab/model/search_model.dart';
import 'package:albab/services/network/meal_data.dart';
import 'package:flutter/cupertino.dart';

enum MealStatus { food_searching,
  end_food_searching,
  error_food_searching, }

class MealSearchProvider extends ChangeNotifier{
  MealStatus _status = MealStatus.food_searching;
  MealModel mealModel = MealModel.empty;

  MealStatus get status => _status;

  set status(MealStatus val) {
    _status = val;
    notifyListeners();
  }

  Future<void> mealSearch(String schoolId, String officeCode, DateTime date) async{
    status = MealStatus.food_searching;
    final response = await mealData(schoolId, officeCode, date);
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