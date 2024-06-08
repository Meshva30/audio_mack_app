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
        title: Text(
          'FEED',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 170,
            ),
            child: Icon(
              Icons.person_outline_sharp,
              color: Colors.orange,
              size: 70,
            ),
          ),
          Text(
            'The Feed',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          Text(
            textAlign: TextAlign.center,
            ' Follow friends and artists to \n discover new music and be the first \n to be notified when new releases \n deop.',
            style: TextStyle(color: Colors.grey, fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            width: 310,
            decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                'Create your feed',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
