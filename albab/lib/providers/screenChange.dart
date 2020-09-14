import 'package:flutter/material.dart';

class ScreenChange extends ChangeNotifier{
  int _selectedPage;
  int get selectedPage => _selectedPage;

  ScreenChange();

  void setPage(int pageNum){
    _selectedPage = pageNum;
    notifyListeners();
  }
}