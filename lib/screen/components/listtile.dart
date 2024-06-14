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
        overflow: TextOverflow.ellipsis,
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
      ),
      subtitle: Text(
        overflow: TextOverflow.ellipsis,
        subtitle,
        style: const TextStyle(color: Colors.grey,),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}
