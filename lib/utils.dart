import 'package:chess/piece.dart';
import 'package:flutter/material.dart';

Widget pieceText(String text, {Color color = Colors.black}) {
  return Text(text, style: TextStyle(fontSize: 32, color: color));
}

PieceColor otherColor(PieceColor other) {
  return other == PieceColor.WHITE ? PieceColor.BLACK : PieceColor.WHITE;
}

String colorAsString(PieceColor color) {
  return color == PieceColor.WHITE ? 'White' : 'Black';
}
