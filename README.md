# Music App

### 1. Set Up Your Flutter Environment

If you haven't already, set up Flutter on your machine:

- Download and install Flutter from [flutter.dev](https://flutter.dev/docs/get-started/install).
- Ensure you have an editor like Visual Studio Code or Android Studio set up with Flutter and Dart plugins.

### 2. Create a New Flutter Project

Open your terminal or command prompt and run:

```bash
flutter create audio_app
cd audio_app
```

### 3. Add Necessary Dependencies

You will need a package to handle audio playback. One of the most popular packages for this purpose is `just_audio`. Add it to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  just_audio: ^0.9.18
  provider: ^6.0.2 # For state management
```

Run `flutter pub get` to install the new dependencies.

### 4. Implementing the User Interface

Open the `lib/main.dart` file and set up a basic UI. For simplicity, we will create a single screen with play, pause, and stop buttons.

```dart
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AudioProvider(),
      child: MaterialApp(
        title: 'Audio App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AudioPlayerScreen(),
      ),
    );
  }
}

class AudioPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Audio App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => audioProvider.play(),
              child: Text('Play'),
            ),
            ElevatedButton(
              onPressed: () => audioProvider.pause(),
              child: Text('Pause'),
            ),
            ElevatedButton(
              onPressed: () => audioProvider.stop(),
              child: Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void play() async {
    try {
      await _audioPlayer.setUrl('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
      _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }
}
```

This simple app provides a basic structure for an audio player. The `AudioProvider` class handles the audio logic using the `just_audio` package, while the UI consists of buttons to control the audio playback.

### 5. Expand Functionality

To build a more comprehensive audio app, you might want to add features like:

- **Audio playlists**: Manage multiple audio tracks.
- **UI enhancements**: Display current track information, add progress bars, etc.
- **State management**: Use `Provider`, `Bloc`, or another state management solution for more complex state handling.
- **Offline support**: Download and play audio files offline.

### Example for Adding a Playlist

You can enhance the `AudioProvider` to manage a playlist:

```dart
class AudioProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<String> _playlist = [
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
  ];
  int _currentIndex = 0;

  void play() async {
    try {
      await _audioPlayer.setUrl(_playlist[_currentIndex]);
      _audioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  void stop() {
    _audioPlayer.stop();
  }

  void next() {
    if (_currentIndex < _playlist.length - 1) {
      _currentIndex++;
      play();
    }
  }

  void previous() {
    if (_currentIndex > 0) {
      _currentIndex--;
      play();
    }
  }
}
```

Update the `AudioPlayerScreen` to include buttons for next and previous:

```dart
ElevatedButton(
  onPressed: () => audioProvider.previous(),
  child: Text('Previous'),
),
ElevatedButton(
  onPressed: () => audioProvider.next(),
  child: Text('Next'),
),
```



### ScreenShort

<p align='center'>
  <img src='https://github.com/Meshva30/audio_mack_app/assets/136339359/b14efe07-c788-45dd-8139-1b5125559054' width=240>
  <img src='https://github.com/Meshva30/audio_mack_app/assets/136339359/125d77cd-8090-44b7-b915-6ec07dcbf182' width=240>
  <img src='https://github.com/Meshva30/audio_mack_app/assets/136339359/604000ff-a130-45bb-9f23-13bc42b35267' width=240>
  <img src='https://github.com/Meshva30/audio_mack_app/assets/136339359/2f378490-1e2b-411a-a282-3ed5572ff147' width=240>
  <img src='https://github.com/Meshva30/audio_mack_app/assets/136339359/a02411c0-21d7-4440-8e16-4c78988ebc08' width=240>
  <img src='https://github.com/Meshva30/audio_mack_app/assets/136339359/c4689129-1b65-4625-aa10-02a9529ed1a5' width=240>
  <img src='https://github.com/Meshva30/audio_mack_app/assets/136339359/990bd2b1-dfed-4bc4-b8ed-9d4d1d1e8711' width=240>
   <img src='https://github.com/Meshva30/audio_mack_app/assets/136339359/2530fc11-1b61-4b56-8e4e-f1ac0e73df75' width=240>
   <img src='https://github.com/Meshva30/audio_mack_app/assets/136339359/0d849e9e-7c61-465d-9bba-4d95ade7755e' width=240>
   <img src='https://github.com/Meshva30/audio_mack_app/assets/136339359/4eac3ba7-2cab-420e-b859-28a2a0baf0ba' width=240>
</p>

### Video






https://github.com/Meshva30/audio_mack_app/assets/136339359/a05be16d-aae3-4b9e-b4c9-6e68037f3d22




