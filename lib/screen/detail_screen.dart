import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_mack_app/modal/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/all_songs_provider.dart';
import '../provider/musicProvider.dart';

class Detail_Screen extends StatefulWidget {
  const Detail_Screen({super.key});

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    final songIndex = ModalRoute.of(context)!.settings.arguments as Map;
    final songProvider = Provider.of<SongProvider>(context, listen: false);
    songProvider.initialize(context);

    MusicProvider musicProviderTrue = Provider.of(context, listen: true);
    MusicProvider musicProviderFalse = Provider.of(context, listen: false);

    if (songProvider.allsong == null) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        actions: [
          Icon(
            Icons.playlist_play_rounded,
            color: Colors.white,
            size: 35,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 28),
        child: Column(
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(songProvider.allsong!['img']!),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              songProvider.allsong!['title']!,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              songProvider.allsong!['subtitle']!,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      'Like',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.playlist_add,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      'PlayList',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      'Mod',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      'Download',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      'Share',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                StreamBuilder(
                  stream: _assetsAudioPlayer.currentPosition,
                  builder: (context, snapshot) {
                    final Duration currentPosition =
                        snapshot.data ?? Duration.zero;
                    return Row(
                      children: [
                        Text(
                          ' ${currentPosition.toString().split('.').first}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                        StreamBuilder(
                          stream: _assetsAudioPlayer.current,
                          builder: (context, snapshot) {
                            final Playing? current = snapshot.data;
                            final Duration? totalDuration =
                                current?.audio.duration;
                            return Row(
                              children: [
                                SizedBox(
                                  width: 270,
                                  child: Slider(
                                    inactiveColor: Colors.grey,
                                    activeColor: Colors.orange,
                                    value: currentPosition.inSeconds.toDouble(),
                                    min: 0,
                                    max: totalDuration?.inSeconds.toDouble() ??
                                        1,
                                    onChanged: (value) {
                                      _assetsAudioPlayer.seek(
                                          Duration(seconds: value.toInt()));
                                    },
                                  ),
                                ),
                                Text(
                                  totalDuration?.toString().split('.').first ??
                                      '',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 30,
                ),
                IconButton(
                  onPressed: () {
                    musicProviderFalse.previousSong();
                  },
                  icon: const Icon(
                    Icons.skip_previous_sharp,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (musicProviderTrue.isPlaying) {
                      musicProviderFalse.assetsAudioPlayer?.pause();
                    } else {
                      musicProviderFalse.assetsAudioPlayer?.play();
                    }
                    musicProviderFalse.playAndPause();
                  },
                  icon: Icon(
                    musicProviderTrue.isPlaying
                        ? Icons.pause
                        : Icons.play_circle_outline,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    musicProviderFalse.nextSong();
                  },
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
                const Icon(
                  Icons.queue_music_sharp,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

bool isOn = false;
