import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset('assets/img/logo.png'),
        title: const Text(
          'FEED',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 150,
            ),
            child: Icon(
              Icons.person_outline_sharp,
              color: Colors.orange,
              size: 70,
            ),
          ),
          const Text(
            'The Feed',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          const Text(
            textAlign: TextAlign.center,
            ' Follow friends and artists to \n discover new music and be the first \n to be notified when new releases \n deop.',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 280,
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30)),
            child: const Center(
              child: Text(
                'Create your feed',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
