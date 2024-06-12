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
  // final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioPlayerProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:Colors.blue.shade500,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 28,
            color: Colors.white,
          ),
        ),
        actions: [
          Icon(
            Icons.playlist_play_rounded,
            color: Colors.white,
            size: 40,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade500,
              Colors.blue.shade900,
              Colors.black,
              Colors.black,
              Colors.black,
              Colors.black,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 28),
          child: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        AssetImage(SongsList[audioProvider.songIndex]['img']),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                SongsList[audioProvider.songIndex]['title'],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                SongsList[audioProvider.songIndex]['subtitle'],
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
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 1.5,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 6),
                ),
                child: Slider(
                  activeColor: Colors.white,
                  value: audioProvider.sliderValue,
                  max: audioProvider.maxDuration > 0
                      ? audioProvider.maxDuration
                      : 1.0,
                  onChanged: (value) {
                    if (audioProvider.maxDuration > 0) {
                      audioProvider.seek(value);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${audioProvider.sliderValue ~/ 60}:',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          (audioProvider.sliderValue.toInt() % 60)
                              .toString()
                              .padLeft(2, '0'),
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${audioProvider.maxDuration ~/ 60}:',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '${(audioProvider.maxDuration.toInt() % 60).toString()..padRight(2, '0')}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
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
                      audioProvider.previousAudio();
                    },
                    icon: const Icon(
                      Icons.skip_previous_sharp,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      audioProvider.togglePlayPause();
                    },
                    icon: Icon(
                      audioProvider.isPlaying
                          ? Icons.pause
                          : Icons.play_circle_outline,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      audioProvider.nextAudio();
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
      ),
    );
  }
}

bool isOn = false;
