import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/containerlist.dart';
import '../../modal/list.dart';
import '../../provider/musicProvider.dart';
import 'container_Box.dart';
import 'containerbox.dart';
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
        title: const Text(
          'PLAYLISTS',
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
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Row(
                  children: [
                    Text(
                      "POPULAR IN YOUR AREA",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      'VIEW ALL',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold,fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 750,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: SongsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1/1.3,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      audioProvider.changeIndex(index);
                      audioProvider.openAudio(); // changes

                      Navigator.of(context)
                          .pushNamed('/details', arguments: SongsList[index]);
                    },
                    child: containerbox(
                        title: SongsList[index]['title'],
                        subtitle: SongsList[index]['subtitle'],
                        img: "${SongsList[index]['img']}"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // SizedBox(
              //   height: 260,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: SongsList1.length,
              //     itemBuilder: (context, index) => containerbox(
              //         title: SongsList1[index]['title'],
              //         subtitle: SongsList1[index]['subtitle'],
              //         img: "${SongsList1[index]['img']}"),
              //   ),
              // ),
              // SizedBox(
              //   height: 260,
              //   child: ListView.builder(
              //     scrollDirection: Axis.vertical,
              //     itemCount: SongsList.length,
              //     itemBuilder: (context, index) => list_tileScreen(
              //       title: SongsList[index]['title'],
              //       subtitle: SongsList[index]['subtitle'],
              //       img: "${SongsList[index]['img']}",
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
