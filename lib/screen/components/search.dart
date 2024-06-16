import 'package:audio_mack_app/screen/components/listtile.dart';
import 'package:flutter/material.dart';

import '../../modal/containerlist.dart';
import '../../modal/list.dart';
import 'container_Box.dart';
import 'containerbox.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset('assets/img/logo.png'),
        title: const Text(
          'SEARCH',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        actions: [
          const Icon(
            Icons.download,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.notifications,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
            size: 25,
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 40,
                  width: 420,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Artists, songs, albums, and playlists...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.orange,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "TOP SONGS CHART",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      'VIEW ALL',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: SongsList1.length,
                  itemBuilder: (context, index) => containerbox(
                      title: SongsList1[index]['title'],
                      subtitle: SongsList1[index]['subtitle'],
                      img: "${SongsList1[index]['img']}"),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "TOP SONGS CHART",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      'VIEW ALL',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 350,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: SongsList.length,
                  itemBuilder: (context, index) => list_tileScreen(
                    title: SongsList[index]['title'],
                    subtitle: SongsList[index]['subtitle'],
                    img: "${SongsList[index]['img']}",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
