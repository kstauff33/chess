import 'package:chess/model/board.dart';
import 'package:chess/model/piece.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Board board;
  setUp(() async {
    board = Board();
  });
  group('Board', () {
    test('.getAtPosition(x, y)', () {
      expect(board.getAtPosition(x: 0, y: 0).runtimeType, Rook);
      expect(board.getAtPosition(x: 1, y: 0).runtimeType, Knight);
      expect(board.getAtPosition(x: 2, y: 0).runtimeType, Bishop);
      expect(board.getAtPosition(x: 3, y: 0).runtimeType, Queen);
      expect(board.getAtPosition(x: 4, y: 0).runtimeType, King);
      expect(board.getAtPosition(x: 5, y: 0).runtimeType, Bishop);
      expect(board.getAtPosition(x: 6, y: 0).runtimeType, Knight);
      expect(board.getAtPosition(x: 7, y: 0).runtimeType, Rook);

      for (int x = 0; x < 8; x++) {
        expect(board.getAtPosition(x: x, y: 1).runtimeType, Pawn);
      }

      expect(board.getAtPosition(x: 0, y: 7).runtimeType, Rook);
      expect(board.getAtPosition(x: 1, y: 7).runtimeType, Knight);
      expect(board.getAtPosition(x: 2, y: 7).runtimeType, Bishop);
      expect(board.getAtPosition(x: 3, y: 7).runtimeType, Queen);
      expect(board.getAtPosition(x: 4, y: 7).runtimeType, King);
      expect(board.getAtPosition(x: 5, y: 7).runtimeType, Bishop);
      expect(board.getAtPosition(x: 6, y: 7).runtimeType, Knight);
      expect(board.getAtPosition(x: 7, y: 7).runtimeType, Rook);

      for (int x = 0; x < 8; x++) {
        expect(board.getAtPosition(x: x, y: 6).runtimeType, Pawn);
      }
    });

    test('.getAtPosition(position)', () {
      expect(board.getAtPosition(position: Position(x: 0, y: 0)).runtimeType,
          Rook);
      expect(board.getAtPosition(position: Position(x: 1, y: 0)).runtimeType,
          Knight);
      expect(board.getAtPosition(position: Position(x: 2, y: 0)).runtimeType,
          Bishop);
      expect(board.getAtPosition(position: Position(x: 3, y: 0)).runtimeType,
          Queen);
      expect(board.getAtPosition(position: Position(x: 4, y: 0)).runtimeType,
          King);
      expect(board.getAtPosition(position: Position(x: 5, y: 0)).runtimeType,
          Bishop);
      expect(board.getAtPosition(position: Position(x: 6, y: 0)).runtimeType,
          Knight);
      expect(board.getAtPosition(position: Position(x: 7, y: 0)).runtimeType,
          Rook);

      for (int x = 0; x < 8; x++) {
        expect(board.getAtPosition(position: Position(x: x, y: 1)).runtimeType,
            Pawn);
      }

      expect(board.getAtPosition(position: Position(x: 0, y: 7)).runtimeType,
          Rook);
      expect(board.getAtPosition(position: Position(x: 1, y: 7)).runtimeType,
          Knight);
      expect(board.getAtPosition(position: Position(x: 2, y: 7)).runtimeType,
          Bishop);
      expect(board.getAtPosition(position: Position(x: 3, y: 7)).runtimeType,
          Queen);
      expect(board.getAtPosition(position: Position(x: 4, y: 7)).runtimeType,
          King);
      expect(board.getAtPosition(position: Position(x: 5, y: 7)).runtimeType,
          Bishop);
      expect(board.getAtPosition(position: Position(x: 6, y: 7)).runtimeType,
          Knight);
      expect(board.getAtPosition(position: Position(x: 7, y: 7)).runtimeType,
          Rook);

      for (int x = 0; x < 8; x++) {
        expect(board.getAtPosition(position: Position(x: x, y: 6)).runtimeType,
            Pawn);
      }
    });

    test('.setAtPosition()', () {
      var piece = PieceFactory().pieceOfColor(Pawn, PieceColor.WHITE);
      board.setAtPosition(piece: piece, x: 4, y: 4);
      expect(board.getAtPosition(x: 4, y: 4), piece);
    });

    test('.movePiece(to empty)', () {
      var piece = board.getAtPosition(x: 0, y: 0);
      var toPosition = Position(x: 4, y: 4);
      board.movePiece(piece, toPosition);
      expect(board.getAtPosition(position: toPosition), piece);
      expect(board.getAtPosition(x: 0, y: 0), null);
    });

    test('.movePiece(to taken)', () {
      var piece = board.getAtPosition(x: 0, y: 0);
      var toPosition = Position(x: 7, y: 7);
      board.movePiece(piece, toPosition);
      expect(board.getAtPosition(position: toPosition), piece);
      expect(board.getAtPosition(x: 0, y: 0), null);
    });

    test('.getPiecePosition()', () {
      var piece = board.getAtPosition(x: 0, y: 0);
      expect(board.getPiecePosition(piece), Position(x: 0, y: 0));
    });

    test('.getPiecePosition(not on board)', () {
      var piece = PieceFactory().pieceOfColor(Pawn, PieceColor.WHITE);
      expect(() => board.getPiecePosition(piece), throwsException);
    });

    test('.availableMoves(pawn -> start)', () {
      var moves = [
        Position(x: 0, y: 2),
        Position(x: 0, y: 3),
      ];
      expect(board.availableMoves(board.getAtPosition(x: 0, y: 1)), moves);
    });

    test('.availableMoves(pawn -> moved)', () {
      var moves = [
        Position(x: 0, y: 2),
      ];
      var pawn = board.getAtPosition(x: 0, y: 1)!;
      (pawn as Pawn).hasMoved = true;
      expect(board.availableMoves(pawn), moves);
    });

    test('.availableMoves(pawn -> take)', () {
      // move piece into takable position
      board.movePiece(board.getAtPosition(x: 6, y: 6), Position(x: 1, y: 2));

      var moves = [
        Position(x: 0, y: 2),
        Position(x: 1, y: 2),
      ];
      var pawn = board.getAtPosition(x: 0, y: 1)!;
      (pawn as Pawn).hasMoved = true;
      expect(board.availableMoves(pawn), moves);
    });

    test('.availableMoves(pawn -> start)', () {
      var moves = [
        Position(x: 0, y: 2),
        Position(x: 0, y: 3),
      ];
      expect(board.availableMoves(board.getAtPosition(x: 0, y: 1)), moves);
    });

    test('.availableMoves(rook -> start)', () {
      var moves = [];
      expect(board.availableMoves(board.getAtPosition(x: 0, y: 0)), moves);
    });

    test('.availableMoves(knight -> start)', () {
      var moves = [
        Position(x: 0, y: 2),
        Position(x: 2, y: 2),
      ];
      expect(board.availableMoves(board.getAtPosition(x: 1, y: 0)), moves);
    });

    test('.availableMoves(bishop -> start)', () {
      var moves = [];
      expect(board.availableMoves(board.getAtPosition(x: 2, y: 0)), moves);
    });

    test('.availableMoves(queen -> start)', () {
      var moves = [];
      expect(board.availableMoves(board.getAtPosition(x: 3, y: 0)), moves);
    });

    test('.availableMoves(king -> start)', () {
      var moves = [];
      expect(board.availableMoves(board.getAtPosition(x: 4, y: 0)), moves);
    });
  });
}
