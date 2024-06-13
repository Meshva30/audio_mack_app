import 'package:flutter/material.dart';

class TabBarProvider extends ChangeNotifier {
  bool _isSelected = false;

  bool get isSelected => _isSelected;

  void toggleSelected() {
    _isSelected = !_isSelected;
    notifyListeners();
  }
}