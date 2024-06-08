import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/list.dart';
import '../../provider/musicProvider.dart';
import 'container_Box.dart';

class Play extends StatefulWidget {
  const Play({super.key});

  @override
  State<Play> createState() => _PlayState();
}

class _PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    MusicProvider MusicProviderTrue = Provider.of(context, listen: true);
    MusicProvider MusicProviderFalse = Provider.of(context, listen: false);
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
      body: Column(
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
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: SongsList2.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Audio audio = musicList1[index];
                  MusicProviderTrue.assetsAudioPlayer?.open(
                    audio,
                  );
                  Navigator.of(context)
                      .pushNamed('/details', arguments: SongsList2[index]);
                },
                child: containerbox(
                  title: SongsList2[index]['title'],
                  subtitle: SongsList2[index]['subtitle'],
                  img: SongsList2[index]['img'],
                ),
              ),
            ),
          ),
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
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: SongsList2.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Audio audio = musicList1[index];
                  MusicProviderTrue.assetsAudioPlayer?.open(
                    audio,
                  );
                  Navigator.of(context)
                      .pushNamed('/details', arguments: SongsList2[index]);
                },
                child: containerbox(
                  title: SongsList2[index]['title'],
                  subtitle: SongsList2[index]['subtitle'],
                  img: SongsList2[index]['img'],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
