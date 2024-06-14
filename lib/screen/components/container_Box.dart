
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
          margin: const EdgeInsets.all(10),
          height: 150,
          width: 170,
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(img)),
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            textAlign: TextAlign.center,
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            subtitle,
            style: const TextStyle(

              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
