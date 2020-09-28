import 'package:flutter/material.dart';

class SchoolModel {
  List<Object> get props => [status, message, data];

  final int status;
  final String message;
  final List<SchoolDataModel> data;

  SchoolModel({this.status, this.message, this.data});

  factory SchoolModel.fromJson(Map<String, dynamic> json, bool makeData) {
    if (makeData) {
      return SchoolModel(
        status: json["status"],
        message: json["message"],
        data: (json["data"]["school"] as List ).map( (e) => SchoolDataModel.fromJson(e)).toList(),
      );
    }
    return SchoolModel(
      status: json["status"],
      message: json["message"],
    );
  }
}

class SchoolDataModel {
  final String school_name;
  final String school_locate;
  final String office_code;
  final String school_id;

  SchoolDataModel(
      {@required this.school_name,
        @required this.school_locate,
        @required this.office_code,
        @required this.school_id});

  factory SchoolDataModel.fromJson(Map<String, dynamic> json) => json == null ? empty : SchoolDataModel(
    school_name: json["school_name"],
    school_locate: json["school_locate"],
    office_code: json["office_code"],
    school_id: json["school_id"],
  );

  static SchoolDataModel empty = SchoolDataModel(school_name: "", school_locate: "", office_code: "", school_id: "");
}
