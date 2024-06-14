import 'package:audio_mack_app/provider/musicProvider.dart';
import 'package:audio_mack_app/screen/components/containerbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../modal/containerlist.dart';
import '../../modal/list.dart';

import 'container_Box.dart';
import 'listtile.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  void initState() {
    super.initState();
    // Provider.of<AudioPlayerProvider>(context,listen: false).openAudio();
    // changes
  }

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioPlayerProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset('assets/img/logo.png'),
        title: const Text(
          'DISCOVER',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        actions: [
          const Icon(
            Icons.download,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.notifications,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
            size: 25,
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) =>
                    tabbar_container(list[index], index),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "SONGS FOR YOU",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    'VIEW ALL',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              width: double.infinity, // Adjust height as needed
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 315,
                ),
                itemCount: SongsList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    audioProvider.changeIndex(index);
                    // Navigate to details screen
                    Navigator.of(context)
                        .pushNamed('/details', arguments: SongsList[index]);
                  },
                  child: list_tileScreen(
                    title: SongsList[index]['title'],
                    subtitle: SongsList[index]['subtitle'],
                    img: "${SongsList[index]['img']}",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "TRENDIND ALBUMS",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    'VIEW ALL',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: SongsList1.length,
                itemBuilder: (context, index) => containerbox(
                    title: SongsList1[index]['title'],
                    subtitle: SongsList1[index]['subtitle'],
                    img: "${SongsList1[index]['img']}"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "TRENDIND SONGS",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    'VIEW ALL',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 315,
                ),
                itemCount: SongsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      audioProvider.changeIndex(index);
                      audioProvider.openAudio();

                      Navigator.of(context)
                          .pushNamed('/details', arguments: SongsList[index]);
                    },
                    child: list_tileScreen(
                      title: SongsList[index]['title'],
                      subtitle: SongsList[index]['subtitle'],
                      img: "${SongsList[index]['img']}",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
