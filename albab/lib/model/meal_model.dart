import 'package:flutter/material.dart';

class MealModel {
  List<Object> get props => [status, message, data];

  final int status;
  final String message;
  final MealDataModel data;

  MealModel({this.status, this.message, this.data});

  String getFromIdx(idx) {
    if (idx == 0) return data.calories[idx];
    if (idx == 1) return data.calories[idx];
    if (idx == 2) return data.calories[idx];
    return null;
  }

  // bool get isNotEmpty =>
  //     breakfast != MealsDataModel.empty &&
  //         lunch != MealsDataModel.empty &&
  //         dinner != MealsDataModel.empty;

  isEmpty(idx) {
    if (idx == 0)
      return data.meal_menu[idx] == null &&
          data.calories[idx] == null;
    if (idx == 1)
      return data.meal_menu[idx] == null && data.calories[idx] == null;
    if (idx == 2)
      return data.meal_menu[idx] == null && data.calories[idx] == null;
    return false;
  }

  factory MealModel.fromJson(Map<String, dynamic> json, bool makeData) {
    print(json);
    if (makeData) {
      return MealModel(
        status: json["status"],
        message: json["message"],
        data: MealDataModel.fromJson(json["data"]),
      );
    }
    return MealModel(
      status: json["status"],
      message: json["message"],
    );
  }

  static MealModel empty = MealModel(status: null, message: null, data: null);
}

class MealDataModel {
  static MealDataModel empty = MealDataModel(meal_menu: null, calories: null);

  List<String> meal_menu = [null, null, null];
  List<String> calories = [null, null, null];

  MealDataModel({
    @required this.calories,
    @required this.meal_menu,
  });

  factory MealDataModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return empty;

    List<String> temp = [];
    List<String> cal_temp = [];

    List<String> meal_menu = [null, null, null];
    List<String> calories = [null, null, null];

    temp = (json["meal"] as List).map((e) => "$e").toList();
    cal_temp = (json["calories"] as List).map((e) => "$e").toList();

    for (int i = 0; i < temp.length; i++) {
      meal_menu[i] = temp[i];
      calories[i] = cal_temp[i];
    }
    return MealDataModel(
      meal_menu: meal_menu,
      calories: calories,
    );
  }


}
