import 'package:flutter/material.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20
          ),
          child: Column(
            children: [
              const Text(
                textAlign: TextAlign.center,
                'On the next Screen,you be \n asked to opt-in to Tracking.',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Opting in means we can keep the \n Audiomack platform free for you...',
                style: TextStyle(

                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 250,
                width: 350,
                decoration: const BoxDecoration(

                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: AssetImage('assets/img/intro.png'))),
              ),
              const SizedBox(
                height:110,
              ),
              const Text(
                textAlign: TextAlign.center,
                '...Show you more relevant ads,and\n support your favorite artists.',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/intro3');
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
        ));
  }
}
