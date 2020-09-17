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
        data: (json["data"]["school"] as List ).map( (e) => MealDataModel.fromJson(e)).toList(),
      );
    }
    return MealModel(
      status: json["status"],
      message: json["message"],
    );
  }
}

class MealDataModel {
  final String school_name;
  final String school_locate;
  final String office_code;
  final String school_id;

  MealDataModel(
      {@required this.school_name,
      @required this.school_locate,
      @required this.office_code,
      @required this.school_id});

  factory MealDataModel.fromJson(Map<String, dynamic> json) => MealDataModel(
    school_name: json["school_name"],
    school_locate: json["school_locate"],
    office_code: json["office_code"],
    school_id: json["school_id"],
  );

  static MealDataModel empty = MealDataModel(school_name: null, school_locate: null, office_code: null, school_id: null);
}
