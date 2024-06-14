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
    final audioProvider = Provider.of<AudioPlayerProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset('assets/img/logo.png'),
        title: const Text(
          'MY LIBRARY',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        actions: const [
          Icon(
            Icons.download,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(width: 5),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(width: 5),
          Icon(
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
              const ListTile(
                leading: Icon(
                  Icons.download,
                  size: 25,
                  color: Colors.orange,
                ),
                title: Text(
                  'Downloads',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.favorite_border,
                  size: 25,
                  color: Colors.orange,
                ),
                title: Text(
                  'Likes',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.playlist_add,
                  size: 25,
                  color: Colors.orange,
                ),
                title: Text(
                  'Playlists',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.account_circle_sharp,
                  size: 25,
                  color: Colors.orange,
                ),
                title: Text(
                  'My Profile',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.upload,
                  size: 25,
                  color: Colors.orange,
                ),
                title: Text(
                  'Uploads',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "TRENDING ALBUMS",
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
              SizedBox(
                height: 750,
                child: GridView.builder(

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
            ],
          ),
        ),
      ),
    );
  }
}
