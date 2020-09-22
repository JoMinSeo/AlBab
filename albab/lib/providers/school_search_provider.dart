import 'dart:convert';

import 'package:albab/model/search_model.dart';
import 'package:albab/services/network/search_data.dart';
import 'package:flutter/material.dart';

enum SearchStatus { uncomplete, complete, loading }

class SchoolSearchProvider extends ChangeNotifier {
  SearchStatus _status = SearchStatus.uncomplete;
  SearchModel searchModel;

  SearchStatus get status => _status;

  set status(SearchStatus val) {
    _status = val;
    notifyListeners();
  }

  Future<void> schoolSearch(String schoolName) async {
    status = SearchStatus.loading;
    final response = await searchData(schoolName);
    if (response.status == 200) {
      searchModel = response;
      status = SearchStatus.complete;
      return;
    }
    status = SearchStatus.uncomplete;
    return;
  }
}
