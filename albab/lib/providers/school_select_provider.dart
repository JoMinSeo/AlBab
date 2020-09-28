import 'package:albab/model/search_model.dart';
import 'package:flutter/material.dart';

enum SelectStatus { selecting,
  end_selecting,
  non_selecting, }

class SchoolSelectProvider extends ChangeNotifier{
  SelectStatus _status = SelectStatus.non_selecting;
  SchoolDataModel schoolDataModel = SchoolDataModel.empty;

  SelectStatus get status => _status;

  set status(SelectStatus val) {
    _status = val;
    notifyListeners();
  }

  void setData(List<SchoolDataModel> searchDataModel, int index){
    this.schoolDataModel = searchDataModel[index];
    searchDataModel.clear();
  }
}