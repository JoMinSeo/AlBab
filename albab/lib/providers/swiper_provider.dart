import 'package:flutter/material.dart';

class SwiperProvider extends ChangeNotifier{
  int _index = 0;

  set index(val) {
    _index = val;
    notifyListeners();
  }

  get index => _index;
}