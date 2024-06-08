import 'package:flutter/material.dart';

class list_tileScreen extends StatelessWidget {
  const list_tileScreen({
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
    return ListTile(
      leading: Container(
        height: 90,
        width: 60,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img),
          ),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.white, fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.more_vert_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}
