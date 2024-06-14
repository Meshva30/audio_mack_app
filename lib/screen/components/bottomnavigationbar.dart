
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
        icon: const Icon(
          Icons.local_fire_department,
          color: Colors.white,
          size: 25,
        ),
        title: const Text(
          "Discover",
          style: TextStyle(color: Colors.white,fontSize: 12),
        ),
        selectedColor: Colors.white,
      ),

      /// Likes
      SalomonBottomBarItem(
        icon: const Icon(
          Icons.queue_music_rounded,
          color: Colors.white,
          size: 25,
        ),
        title: const Text(
          "Playlist",
          style: TextStyle(color: Colors.white,fontSize: 12,),
        ),
        selectedColor: Colors.white,
      ),

      /// Search
      SalomonBottomBarItem(
        icon: const Icon(
          Icons.search,
          color: Colors.white,
          size: 25,
        ),
        title: const Text(
          "Search",
          style: TextStyle(color: Colors.white,fontSize: 12),
        ),
        selectedColor: Colors.white,
      ),

      SalomonBottomBarItem(
        icon: const Icon(
          Icons.account_circle_sharp,
          color: Colors.white,
          size: 25,
        ),
        title: const Text(
          "Feed",
          style: TextStyle(color: Colors.white,fontSize: 12),
        ),
        selectedColor: Colors.white,
      ),

      /// Profile
      SalomonBottomBarItem(
          icon: const Icon(
            Icons.person,
            color: Colors.white,
            size: 25,
          ),
          title: const Text(
            "Profile",
            style: TextStyle(color: Colors.white,fontSize: 12),
          ),
          selectedColor: Colors.orange,
          unselectedColor: Colors.white),
    ],
  );
}
