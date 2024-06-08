import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_mack_app/provider/musicProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modal/list.dart';
import 'components/bottomnavigationbar.dart';
import 'components/container_Box.dart';
import 'components/listtile.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  void initState() {
    super.initState();
    Provider.of<MusicProvider>(context, listen: false).createMusic();
  }

  @override
  Widget build(BuildContext context) {
    MusicProvider MusicProviderTrue = Provider.of(context, listen: true);
    MusicProvider MusicProviderFalse = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset('assets/img/logo.png'),
        title: Text(
          'DISCOVER',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.download,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "SONGS FOR YOU",
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
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: SongsList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Audio audio = musicList[index];
                  MusicProviderFalse.assetsAudioPlayer?.open(
                    audio,
                  );

                  // Navigate to details screen
                  Navigator.of(context)
                      .pushNamed('/details', arguments: SongsList[index]);
                },
                child: list_tileScreen(
                  title: SongsList[index]['title']!,
                  subtitle: SongsList[index]['subtitle']!,
                  img: SongsList[index]['img']!,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "TRENDIND ALBUMS",
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
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: SongsList2.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Audio audio = musicList1[index];
                    MusicProviderFalse.assetsAudioPlayer?.open(
                      audio,
                    );
                    Navigator.of(context)
                        .pushNamed('/details', arguments: SongsList2[index]);
                  },
                  child: containerbox(
                    title: SongsList2[index]['title'],
                    subtitle: SongsList2[index]['subtitle'],
                    img: SongsList2[index]['img'],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "TRENDIND SONGS",
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
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: SongsList1.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Audio audio = musicList2[index];
                  MusicProviderFalse.assetsAudioPlayer!.open(
                    audio,
                  );
                  Navigator.of(context)
                      .pushNamed('/details', arguments: SongsList1[index]);
                },
                child: list_tileScreen(
                  title: SongsList1[index]['title'],
                  subtitle: SongsList1[index]['subtitle'],
                  img: SongsList1[index]['img'],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "TRENDIND ALBUMS",
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
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: SongsList2.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Audio audio = musicList1[index];
                    MusicProviderFalse.assetsAudioPlayer?.open(
                      audio,
                    );
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
      ),
      bottomNavigationBar: buildSalomonBottomBar(context),
    );
  }
}
