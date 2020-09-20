import 'package:flutter/material.dart';

class MealModel {
  List<Object> get props => [status, message, data];

  final int status;
  final String message;
  final List<MealDataModel> data;

  MealModel({this.status, this.message, this.data});

  factory MealModel.fromJson(Map<String, dynamic> json, bool makeData) {
    if (makeData) {
      return MealModel(
          status: json["status"],
          message: json["message"],
          data: json["data"],
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
    meal_menu: json["meal"],
    calories: json["calories"],
  );

  static MealDataModel empty = MealDataModel(meal_menu: null, calories: null);
}
