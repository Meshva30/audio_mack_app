

import 'dart:developer';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../modal/list.dart';


class AudioPlayerProvider with ChangeNotifier {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  double _sliderValue = 0.0;
  double _maxDuration = 0.0;
  bool _isPlaying = false;
  int songIndex = 0;


  double get sliderValue => _sliderValue;
  bool get isPlaying => _isPlaying;
  double get maxDuration => _maxDuration;

  void changeIndex(int index) {
    songIndex = index;
    notifyListeners();
  }

  void openAudio() async {
    await _assetsAudioPlayer.open(
      Audio(SongsList[songIndex]['song']),
      autoStart: true,
      // showNotification: true,
    );
    _isPlaying = true;
    notifyListeners();

    log(SongsList[songIndex]['song']);

    _assetsAudioPlayer.currentPosition.listen((Duration position) {
      if (_maxDuration != 0.0) {
        _sliderValue = position.inSeconds.toDouble();
        notifyListeners();
      }
    });

    _assetsAudioPlayer.current.listen((Playing? playing) {
      if (playing != null) {
        final duration = playing.audio.duration;
        _maxDuration = duration.inSeconds.toDouble();
        notifyListeners();
      }
    });

    play();
    notifyListeners();
  }

  void play() {
    _assetsAudioPlayer.play();
    _isPlaying = true;
    notifyListeners();
  }

  void pause() {
    _assetsAudioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void previousAudio() {
    if (songIndex > 0) {
      songIndex--;
    } else {
      songIndex = SongsList.length - 1;
    }
    openAudio();
  }


  void togglePlayPause() {
    if (_isPlaying) {
      pause();
    } else {
      play();
    }
  }

  void nextAudio() {
    if (songIndex < SongsList.length - 1) {
      songIndex++;
    } else {
      songIndex = 0;
    }
    openAudio();
  }

  void seek(double seconds) {
    _assetsAudioPlayer.seek(Duration(seconds: seconds.toInt()));
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

}
