import 'package:flutter/material.dart';

class ScreenChange extends ChangeNotifier{
  int selectedPage = 0;

  void setPage(int pageNum){
    selectedPage = pageNum;
  }
}