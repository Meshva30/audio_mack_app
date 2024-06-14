import 'package:flutter/material.dart';

Widget tabbar_container(String text, int index) {
  return Container(
    margin: const EdgeInsets.all(5),
    height: 40,
    width: 85,
    decoration: BoxDecoration(
        color: (index == 0) ? Colors.orange : Colors.transparent,
        border: Border.all(color: Colors.grey.shade800, width: 2),
        borderRadius: BorderRadius.circular(20)),
    child: Center(
        child: Text(
      text,
      style: TextStyle(
          color: (index == 0) ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold),
    )),
  );
}
