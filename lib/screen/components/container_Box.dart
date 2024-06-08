
import 'package:flutter/material.dart';

class containerbox extends StatelessWidget {
  const containerbox({
    super.key,
    required this.title,
    required this.subtitle,
    required this.img,
  });

  final String title;
  final String subtitle;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          height: 170,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(img)),
          ),
        ),
        SizedBox(
          height: 9,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
