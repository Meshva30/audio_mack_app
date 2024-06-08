import 'package:audio_mack_app/screen/components/account.dart';
import 'package:audio_mack_app/screen/components/play.dart';
import 'package:audio_mack_app/screen/components/profile.dart';
import 'package:audio_mack_app/screen/components/search.dart';
import 'package:audio_mack_app/screen/components/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../provider/bottomnavigationbar.dart';

SalomonBottomBar buildSalomonBottomBar(BuildContext context) {
  return SalomonBottomBar(
    currentIndex: Provider
        .of<BottomProvider>(context)
        .bottomIndex,
    onTap: (value) {
      Provider.of<BottomProvider>(context, listen: false)
          .changeBottomIndex(value);
    },
    items: [

      /// Home
      SalomonBottomBarItem(
        icon: Icon(
          Icons.local_fire_department,
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          "Discover",
          style: TextStyle(color: Colors.white),
        ),
        selectedColor: Colors.white,
      ),

      /// Likes
      SalomonBottomBarItem(
        icon: Icon(
          Icons.queue_music_rounded,
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          "Palylists",
          style: TextStyle(color: Colors.white),
        ),
        selectedColor: Colors.white,
      ),

      /// Search
      SalomonBottomBarItem(
        icon: Icon(
          Icons.search,
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          "Search",
          style: TextStyle(color: Colors.white),
        ),
        selectedColor: Colors.white,
      ),

      SalomonBottomBarItem(
        icon: Icon(
          Icons.account_circle_sharp,
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          "Feed",
          style: TextStyle(color: Colors.white),
        ),
        selectedColor: Colors.white,
      ),

      /// Profile
      SalomonBottomBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white),
          ),
          selectedColor: Colors.orange,
          unselectedColor: Colors.white),
    ],
  );
}
