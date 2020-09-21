import 'dart:convert';

import 'package:albab/model/today_meal_model.dart';
import 'package:http/http.dart' as http;

final client = http.Client();
final baseUrl = "http://34.64.101.114";

Future<TodayMealModel> todayMealData(String schoolId, String officeCode) async {
  try {
    final response = await client.get("$baseUrl/meal/today?school_id=$schoolId&office_code=$officeCode",
        headers: {"Content-Type": "application/json"});
    if(response.statusCode == 200){
      return TodayMealModel.fromJson(json.decode(response.body), false);
    }else{
      return TodayMealModel.fromJson(json.decode(response.body), false);
    }
  } catch (e) {
    return null;
  }
}
