import 'package:audio_mack_app/provider/all_songs_provider.dart';
import 'package:audio_mack_app/provider/bottomnavigationbar.dart';
import 'package:audio_mack_app/provider/musicProvider.dart';
import 'package:audio_mack_app/screen/MainScreen.dart';
import 'package:audio_mack_app/screen/detail_screen.dart';
import 'package:audio_mack_app/screen/components/homeScreen.dart';
import 'package:audio_mack_app/screen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AudioPlayerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SongProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Splashscreen(),
          '/main': (context) => MainScreen(),
          // '/home': (context) => Homescreen(),

          '/details': (context) => Detail_Screen(),
        });
    // home: Homescreen(),
  }
}
