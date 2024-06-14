// //
// //
// // import 'package:assets_audio_player/assets_audio_player.dart';
// // import 'package:audio_mack_app/modal/list.dart';
// // import 'package:flutter/material.dart';
// //
// // class MusicProvider extends ChangeNotifier {
// //   AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
// //   bool _isPlaying = false;
// //
// //   Duration _totalDuration = Duration(seconds: 0);
// //   Duration _currentDuration = Duration(seconds: 0);
// //
// //   MusicProvider() {
// //     _assetsAudioPlayer.current.listen((event) {
// //       if (event != null) {
// //         _totalDuration = event.audio.duration;
// //         notifyListeners();
// //       }
// //     });
// //
// //     _assetsAudioPlayer.currentPosition.listen((position) {
// //       _currentDuration = position;
// //       notifyListeners();
// //     });
// //   }
// //
// //   get assetsAudioPlayer => null;
// //
// //   void createMusic() {
// //     _assetsAudioPlayer.open(
// //       Playlist(audios: musicList),
// //       autoStart: false,
// //       showNotification: true,
// //     );
// //   }
// //
// //   bool get isPlaying => _isPlaying;
// //   Duration get totalDuration => _totalDuration;
// //   Duration get currentDuration => _currentDuration;
// //
// //   void playAndPause() {
// //     if (_isPlaying) {
// //       _assetsAudioPlayer.pause();
// //     } else {
// //       _assetsAudioPlayer.play();
// //     }
// //     _isPlaying = !_isPlaying;
// //     notifyListeners();
// //   }
// //
// //   Future<void> nextSong() async {
// //     await _assetsAudioPlayer.next();
// //   }
// //
// //   Future<void> previousSong() async {
// //     await _assetsAudioPlayer.previous();
// //   }
// // }
//
//
// import 'dart:developer';
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
//   // changes
//   void createMusic(List<Audio> list) {
//     _assetsAudioPlayer.open(
//       Playlist(audios: list),
//       autoStart: false,
//       showNotification: true,
//     );
//     notifyListeners();
//   }
//
//   //changes
//   void playAtIndex(int index) {
//     _assetsAudioPlayer.playlistPlayAtIndex(index);
//     _assetsAudioPlayer.isPlaying.listen((value){
//       _isPlaying = value;
//     });
//     notifyListeners();
//   }
//
//   bool get isPlayingBool => _isPlaying;
//
//   Duration get totalDuration => _totalDuration;
//
//   Duration get currentDuration => _currentDuration;
//
//   void playAndPause() {
//     _assetsAudioPlayer.playOrPause();
//     _assetsAudioPlayer.isPlaying.listen((value){
//       _isPlaying = value;
//     });
//     notifyListeners();
//   }
//
//
//   // changes
//   Future<void> nextSong() async {
//     await _assetsAudioPlayer.next();
//     _assetsAudioPlayer.isPlaying.listen((value){
//       _isPlaying = value;
//     });
//     notifyListeners();
//   }
//
//
//   // changes
//
//   Future<void> previousSong() async {
//     await _assetsAudioPlayer.previous();
//     _assetsAudioPlayer.isPlaying.listen((value){
//       _isPlaying = value;
//     });
//     notifyListeners();
//   }
//
// }

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
      showNotification: true,
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