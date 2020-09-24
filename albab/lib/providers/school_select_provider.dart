import 'package:albab/model/search_model.dart';
import 'package:flutter/material.dart';

enum SelectStatus { unloading, complete, loading }

class SchoolSelectProvider extends ChangeNotifier{
  SelectStatus _status = SelectStatus.unloading;
  SearchDataModel searchDataModel;

  SelectStatus get status => _status;

  set status(SelectStatus val) {
    _status = val;
    notifyListeners();
  }

  void setData(List<SearchDataModel> searchDataModel, int index){
    this.searchDataModel = searchDataModel[index];
    searchDataModel.clear();
  }
}