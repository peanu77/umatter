import 'package:flutter/material.dart';

Widget buildHotlineCardWidget({
  required bgColor,
  required height,
  required width,
  required number,
  required icon,
  required route,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.white),
      onPressed: () => route,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(number),
          icon,
        ],
      ),
    ),
  );
}
