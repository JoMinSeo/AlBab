import 'package:flutter/material.dart';

class TodayMealModel {
  List<Object> get props => [status, message, data];

  final int status;
  final String message;
  final List<TodayMealDataModel> data;

  TodayMealModel({this.status, this.message, this.data});

  factory TodayMealModel.fromJson(Map<String, dynamic> json, bool makeData) {
    if (makeData) {
      return TodayMealModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );
    }
    return TodayMealModel(
      status: json["status"],
      message: json["message"],
    );
  }
}

class TodayMealDataModel {
  final List<String> meal_menu;
  final List<String> calories;

  TodayMealDataModel({
    @required this.calories,
    @required this.meal_menu,
  });

  factory TodayMealDataModel.fromJson(Map<String, dynamic> json) => TodayMealDataModel(
    meal_menu: json["meal"],
    calories: json["calories"],
  );

  static TodayMealDataModel empty = TodayMealDataModel(meal_menu: null, calories: null);
}
