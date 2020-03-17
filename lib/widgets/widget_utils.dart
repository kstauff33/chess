import 'package:flutter/material.dart';

Widget pieceText(String text, {Color color = Colors.black}) {
  return Text(text, style: TextStyle(fontSize: 32, color: color));
}

Widget titleText(String text) {
  return Text(text,
      style: TextStyle(fontSize: 32, color: Colors.grey.shade700));
}
