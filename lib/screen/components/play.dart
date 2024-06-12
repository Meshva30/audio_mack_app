import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/list.dart';
import '../../provider/musicProvider.dart';
import 'container_Box.dart';
import 'listtile.dart';

class Play extends StatefulWidget {
  const Play({super.key});

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioPlayerProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset('assets/img/logo.png'),
        title: Text(
          'PLAYLISTS',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.download,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            Row(
              children: [
                Text(
                  "POPULAR IN YOUR AREA",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Spacer(),
                Text(
                  'VIEW ALL',
                  style:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              width: double.infinity, // Adjust height as needed
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 450,
                ),
                itemCount: SongsList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    audioProvider.changeIndex(index);
                    audioProvider.openAudio(); // changes
                    // Navigate to details screen
                    Navigator.of(context)
                        .pushNamed('/details', arguments: SongsList[index]);
                  },
                  child: list_tileScreen(
                    title: SongsList[index]['title'],
                    subtitle: SongsList[index]['subtitle'],
                    img: "${SongsList[index]['img']}",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: SongsList1.length,
                itemBuilder: (context, index) => containerbox(
                    title: SongsList1[index]['title'],
                    subtitle: SongsList1[index]['subtitle'],
                    img: "${SongsList1[index]['img']}"),
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity, // Adjust height as needed
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 450,
                ),
                itemCount: SongsList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    audioProvider.changeIndex(index);
                    audioProvider.openAudio(); // changes
                    // Navigate to details screen
                    Navigator.of(context)
                        .pushNamed('/details', arguments: SongsList[index]);
                  },
                  child: list_tileScreen(
                    title: SongsList[index]['title'],
                    subtitle: SongsList[index]['subtitle'],
                    img: "${SongsList[index]['img']}",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
