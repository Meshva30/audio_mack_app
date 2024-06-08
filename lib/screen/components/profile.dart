import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/list.dart';
import '../../provider/musicProvider.dart';
import 'container_Box.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    MusicProvider musicProviderTrue =
        Provider.of<MusicProvider>(context, listen: true);
    MusicProvider musicProviderFalse =
        Provider.of<MusicProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset('assets/img/logo.png'),
        title: Text(
          'MY LIBRARY',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.download,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 5),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 5),
          Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.download,
              size: 28,
              color: Colors.orange,
            ),
            title: Text(
              'Downloads',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.favorite_border,
              size: 28,
              color: Colors.orange,
            ),
            title: Text(
              'Likes',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.playlist_add,
              size: 28,
              color: Colors.orange,
            ),
            title: Text(
              'Playlists',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle_sharp,
              size: 28,
              color: Colors.orange,
            ),
            title: Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.upload,
              size: 28,
              color: Colors.orange,
            ),
            title: Text(
              'Uploads',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                Text(
                  "TRENDING ALBUMS",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Spacer(),
                Text(
                  'VIEW ALL',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: SongsList2.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Audio audio = musicList1[index];
                  musicProviderFalse.assetsAudioPlayer?.open(audio);
                  Navigator.of(context)
                      .pushNamed('/details', arguments: SongsList2[index]);
                },
                child: containerbox(
                  title: SongsList2[index]['title']!,
                  subtitle: SongsList2[index]['subtitle']!,
                  img: SongsList2[index]['img']!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
