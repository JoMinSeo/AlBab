import 'package:flutter/material.dart';

class MealModel {
  List<Object> get props => [status, message, data];

  final int status;
  final String message;
  final MealDataModel data;

  MealModel({this.status, this.message, this.data});

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
}

class MealDataModel {
  final List<String> meal_menu;
  final List<String> calories;

  MealDataModel({
    @required this.calories,
    @required this.meal_menu,
  });

  factory MealDataModel.fromJson(Map<String, dynamic> json) => MealDataModel(
    meal_menu: (json["meal"] as List).map((e) => "$e").toList(),
    calories: (json["calories"] as List).map((e)=>"$e").toList(),
  );

  static MealDataModel empty = MealDataModel(meal_menu: null, calories: null);
}
