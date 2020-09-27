import 'package:albab/model/meal_model.dart';
import 'package:albab/model/search_model.dart';
import 'package:albab/services/network/meal_data.dart';
import 'package:flutter/cupertino.dart';

enum MealStatus { unloading, complete, loading }

class MealSearchProvider extends ChangeNotifier{
  MealStatus _status = MealStatus.unloading;
  MealModel mealModel;

  MealStatus get status => _status;

  set status(MealStatus val) {
    _status = val;
    notifyListeners();
  }

  Future<void> mealSearch(String schoolId, String officeCode, DateTime date) async{
    status = MealStatus.loading;
    final response = await mealData(schoolId, officeCode, date);
    print(response);
    if(response.status == 200){
      mealModel = response;
      status = MealStatus.complete;
      return;
    }
    status = MealStatus.unloading;
    return;
  }
}