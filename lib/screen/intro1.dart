import 'package:flutter/material.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 220, left: 20,right: 20),
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
              'An Important message \n from Audiomack',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white),
                children: [
                  TextSpan(
                      text:
                          'We need your permission to serve \n relevant,personailzed ads, support your \n favorite artists,and ',style: TextStyle(color: Colors.grey)),
                  TextSpan(
                      text: 'Keep our platform \n FREE.',
                      style: TextStyle(color: Colors.orange,fontSize: 18,fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(
              height: 180,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/intro2');
              },
              child: Container(
                height: 50,
                width: 280,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(40)),
                child: const Center(
                    child: Text(
                  'Continue',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
