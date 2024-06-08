import 'package:flutter/material.dart';

class BottomProvider extends ChangeNotifier{
  int bottomIndex = 0;

  void changeBottomIndex(int value){
    bottomIndex = value;
    notifyListeners();
  }
}