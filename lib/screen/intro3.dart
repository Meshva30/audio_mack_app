import 'package:flutter/material.dart';

class Intro3 extends StatelessWidget {
  const Intro3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/logo.png'),
                ),
              ),
            ),
            const Text(
              'Please select your upload type',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 9,
            ),
            Text(
              textAlign: TextAlign.center,
              'Audiomack gives you unlimited storage for free',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 60,
                width: 400,
                decoration: BoxDecoration(color: Colors.grey.shade900),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.music_note_outlined,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Song",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(color: Colors.grey.shade900),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.photo_album_outlined,
                      color: Colors.orange,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Album/EP",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: 400,
              decoration: BoxDecoration(color: Colors.grey.shade900),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.music_video_sharp,
                      color: Colors.orange,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Non-Musical",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/main');
              },
              child: Container(
                height: 50,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: Text(
                        'Start',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 25,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.center,
              'Audiomack uploads are for artists and content creators only. DO NOT upload your personal music collection or unauthorized content. Accounts which upitnat infringing material will be banned and blocked immediately',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white),
                children: [
                  TextSpan(text: 'Copyright compliance by'),
                  TextSpan(
                      text: 'ACRCloud', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
