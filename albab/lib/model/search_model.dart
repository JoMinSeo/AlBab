import 'package:flutter/material.dart';

class SearchModel {
  List<Object> get props => [status, message, data];

  final int status;
  final String message;
  final List<SearchDataModel> data;

  SearchModel({this.status, this.message, this.data});

  factory SearchModel.fromJson(Map<String, dynamic> json, bool makeData) {
    if (makeData) {
      return SearchModel(
        status: json["status"],
        message: json["message"],
        data: (json["data"]["school"] as List ).map( (e) => SearchDataModel.fromJson(e)).toList(),
      );
    }
    return SearchModel(
      status: json["status"],
      message: json["message"],
    );
  }
}

class SearchDataModel {
  final String school_name;
  final String school_locate;
  final String office_code;
  final String school_id;

  SearchDataModel(
      {@required this.school_name,
        @required this.school_locate,
        @required this.office_code,
        @required this.school_id});

  factory SearchDataModel.fromJson(Map<String, dynamic> json) => SearchDataModel(
    school_name: json["school_name"],
    school_locate: json["school_locate"],
    office_code: json["office_code"],
    school_id: json["school_id"],
  );

  static SearchDataModel empty = SearchDataModel(school_name: null, school_locate: null, office_code: null, school_id: null);
}
