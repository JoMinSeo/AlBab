import 'package:albab/Constants/constants.dart';
import 'package:albab/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SelectStatus {
  selecting,
  end_selecting,
  non_selecting,
}

class SchoolSelectProvider extends ChangeNotifier {
  SelectStatus _status = SelectStatus.non_selecting;
  SchoolDataModel schoolDataModel = SchoolDataModel.empty;

  SelectStatus get status => _status;

  set status(SelectStatus val) {
    _status = val;
    notifyListeners();
  }

  SchoolSelectProvider() {
    loadingData();
  }

  selectSchool(SchoolDataModel model) async {
    status = SelectStatus.selecting;
    schoolDataModel = model;
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(kSchoolName, model.school_name);
    pref.setString(kSchoolId, model.school_id);
    pref.setString(kLocate, model.school_locate);
    pref.setString(kOfficeCode, model.office_code);
    status = SelectStatus.end_selecting;
  }

  Future<void> loadingData() async {
    status = SelectStatus.selecting;
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool use = pref.containsKey(kSchoolName) &&
        pref.containsKey(kSchoolId) &&
        pref.containsKey(kLocate) &&
        pref.containsKey(kOfficeCode);
    if (use) {
      schoolDataModel = SchoolDataModel(
          school_name: pref.getString(kSchoolName),
          school_id: pref.getString(kSchoolId),
          school_locate: pref.getString(kLocate),
          office_code: pref.getString(kOfficeCode));
      status = SelectStatus.end_selecting;
    } else
      status = SelectStatus.non_selecting;
  }
}