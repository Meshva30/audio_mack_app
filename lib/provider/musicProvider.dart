//
//
// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:audio_mack_app/modal/list.dart';
// import 'package:flutter/material.dart';
//
// class MusicProvider extends ChangeNotifier {
//   AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
//   bool _isPlaying = false;
//
//   Duration _totalDuration = Duration(seconds: 0);
//   Duration _currentDuration = Duration(seconds: 0);
//
//   MusicProvider() {
//     _assetsAudioPlayer.current.listen((event) {
//       if (event != null) {
//         _totalDuration = event.audio.duration;
//         notifyListeners();
//       }
//     });
//
//     _assetsAudioPlayer.currentPosition.listen((position) {
//       _currentDuration = position;
//       notifyListeners();
//     });
//   }
//
//   get assetsAudioPlayer => null;
//
//   void createMusic() {
//     _assetsAudioPlayer.open(
//       Playlist(audios: musicList),
//       autoStart: false,
//       showNotification: true,
//     );
//   }
//
//   bool get isPlaying => _isPlaying;
//   Duration get totalDuration => _totalDuration;
//   Duration get currentDuration => _currentDuration;
//
//   void playAndPause() {
//     if (_isPlaying) {
//       _assetsAudioPlayer.pause();
//     } else {
//       _assetsAudioPlayer.play();
//     }
//     _isPlaying = !_isPlaying;
//     notifyListeners();
//   }
//
//   Future<void> nextSong() async {
//     await _assetsAudioPlayer.next();
//   }
//
//   Future<void> previousSong() async {
//     await _assetsAudioPlayer.previous();
//   }
// }


import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_mack_app/modal/list.dart';
import 'package:flutter/material.dart';

class MusicProvider extends ChangeNotifier {
  AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  bool _isPlaying = false;

  Duration _totalDuration = Duration(seconds: 0);
  Duration _currentDuration = Duration(seconds: 0);

  MusicProvider() {
    _assetsAudioPlayer.current.listen((event) {
      if (event != null) {
        _totalDuration = event.audio.duration;
        notifyListeners();
      }
    });

    _assetsAudioPlayer.currentPosition.listen((position) {
      _currentDuration = position;
      notifyListeners();
    });
  }

  get assetsAudioPlayer => null;

  // changes
  void createMusic(List<Audio> list) {
    _assetsAudioPlayer.open(
      Playlist(audios: list),
      autoStart: false,
      showNotification: true,
    );
    notifyListeners();
  }

  //changes
  void playAtIndex(int index) {
    _assetsAudioPlayer.playlistPlayAtIndex(index);
    notifyListeners();
  }

  bool get isPlayingBool => _isPlaying;

  Duration get totalDuration => _totalDuration;

  Duration get currentDuration => _currentDuration;

  void playAndPause() {
    _assetsAudioPlayer.playOrPause();
    _assetsAudioPlayer.isPlaying.listen((value){
      _isPlaying = value;
    });
    notifyListeners();
  }


  // changes
  Future<void> nextSong() async {
    await _assetsAudioPlayer.next();
    _assetsAudioPlayer.isPlaying.listen((value){
      _isPlaying = value;
    });
    notifyListeners();
  }


  // changes

  Future<void> previousSong() async {
    await _assetsAudioPlayer.previous();
    _assetsAudioPlayer.isPlaying.listen((value){
      _isPlaying = value;
    });
    notifyListeners();
  }

}