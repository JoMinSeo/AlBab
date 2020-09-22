import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:albab/model/search_model.dart';

final client = http.Client();
final baseUrl = "http://34.64.101.114";

Future<SearchModel> searchData(String schoolName) async {
  try{
    final response = await client.get("$baseUrl/search?school_name=$schoolName",
      headers: {"Content-Type":"application/json"});
    if(response.statusCode == 200){
      return SearchModel.fromJson(json.decode(response.body), true);
    }else{
      return SearchModel.fromJson(json.decode(response.body), false);
    }
  }catch (e){
    return null;
  }
}