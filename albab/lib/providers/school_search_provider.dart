import 'dart:convert';

import 'package:albab/model/search_model.dart';
import 'package:albab/services/network/search_data.dart';
import 'package:flutter/material.dart';

enum SearchStatus {
  searching,
  end_searching,
  error_search,
  initialization,
  end_initialization,
  saving,
  end_saving,
}

class SchoolSearchProvider extends ChangeNotifier {
  SearchStatus _status = SearchStatus.initialization;
  SchoolModel searchModel;

  SearchStatus get status => _status;

  set status(SearchStatus val) {
    _status = val;
    notifyListeners();
  }

  Future<void> schoolSearch(String schoolName) async {
    status = SearchStatus.searching;
    final response = await searchData(schoolName);
    try {
      if (response.status == 200) {
        searchModel = response;
        status = SearchStatus.end_searching;
        return;
      }
      searchModel = response;
      status = SearchStatus.error_search;
    } on Exception {
      status = SearchStatus.error_search;
    }
  }
}
