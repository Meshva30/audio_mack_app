import 'package:audio_mack_app/screen/components/account.dart';
import 'package:audio_mack_app/screen/components/play.dart';
import 'package:audio_mack_app/screen/components/profile.dart';
import 'package:flutter/material.dart';

import '../screen/components/homeScreen.dart';
import '../screen/components/search.dart';


class BottomProvider with ChangeNotifier {
  int _bottomIndex = 0;

  int get bottomIndex => _bottomIndex;

  void changeBottomIndex(int index) {
    _bottomIndex = index;
    notifyListeners();
  }

  Widget get currentScreen {
    switch (_bottomIndex) {
      case 0:
        return const Homescreen();
      case 1:
        return const Play();
      case 2:
        return Search();
      case 3:
        return const Account();
      case 4:
        return const Profile();
      default:
        return const Homescreen();
    }
  }
}
