import 'package:flutter/material.dart';

class SongProvider extends ChangeNotifier {
  Map? allsong;

  void initialize(BuildContext context) {
    allsong = ModalRoute.of(context)!.settings.arguments as Map?;
    // notifyListeners(); // Notify listeners if necessary
  }
}