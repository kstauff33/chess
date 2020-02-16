import 'package:chess_server/model/piece.dart';

PieceColor otherColor(PieceColor other) {
  return other == PieceColor.WHITE ? PieceColor.BLACK : PieceColor.WHITE;
}

String colorAsString(PieceColor color) {
  return color == PieceColor.WHITE ? 'White' : 'Black';
}
