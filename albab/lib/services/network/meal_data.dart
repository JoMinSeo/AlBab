import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:albab/model/meal_model.dart';
import 'package:date_format/date_format.dart';

final client = http.Client();
final baseUrl = "http://34.64.101.114";

Future<MealModel> mealData(
    String schoolId, String officeCode, DateTime date) async {
  try {
    final newDate = formatDate(date, [yyyy, '-', mm, '-', dd]);
    final response = await client.get(
        "$baseUrl/meal?school_id=$schoolId&office_code=$officeCode&date=${date.year}-${date.month}-${date.day}",
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      MealModel model = MealModel.fromJson(json.decode(response.body), true);
      return model;
    } else {
      return MealModel.fromJson(json.decode(response.body), false);
    }
  } catch (e) {
    print(e);
    return null;
  }
}
