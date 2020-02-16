import 'package:chess_server/model/utils.dart';
import 'package:meta/meta.dart';

import 'board.dart';

enum PieceType { PAWN, ROOK, KNIGHT, BISHOP, QUEEN, KING }

enum PieceColor { WHITE, BLACK }

enum Direction { UP, DOWN }

abstract class Piece {
  final String id;
  final PieceColor color;
  final Direction direction;
  final PieceType type;

  Piece({
    @required this.id,
    @required this.direction,
    @required this.type,
    @required this.color,
  });

  List<Position> availableMoves(Board board);

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(other) {
    if (other is! Piece) return false;
    return id == other.id;
  }

  @override
  String toString() {
    return '${colorAsString(color)} $runtimeType';
  }

  String getLetter();
}

class Pawn extends Piece {
  var hasMoved = false;

  Pawn({
    @required String id,
    @required Direction direction,
    @required PieceColor color,
  }) : super(
          id: id,
          direction: direction,
          type: PieceType.PAWN,
          color: color,
        );

  @override
  List<Position> availableMoves(Board board) {
    // TODO En passant
    var potentialMoves = <Position>[];
    var position = board.getPiecePosition(this);
    var forwardOne =
        BoardCursor(piece: this, startPosition: position, board: board)
          ..forward();
    var forwardTwo =
        BoardCursor(piece: this, startPosition: position, board: board)
          ..forward()
          ..forward();
    var takeLeft =
        BoardCursor(piece: this, startPosition: position, board: board)
          ..forward()
          ..left();
    var takeRight =
        BoardCursor(piece: this, startPosition: position, board: board)
          ..forward()
          ..right();

    // can move forward 1?
    var maybePosition = forwardOne.getPosition();
    if (board.getAtPosition(position: maybePosition) == null) {
      potentialMoves.add(forwardOne.getPosition());

      // can move forward 2?
      if (!hasMoved) {
        var maybePosition = forwardTwo.getPosition();
        if (board.getAtPosition(position: maybePosition) == null) {
          potentialMoves.add(forwardTwo.getPosition());
        }
      }
    }

    // can take?
    var takeLeftPiece = board.getAtPosition(position: takeLeft.getPosition());
    var takeRightPiece = board.getAtPosition(position: takeRight.getPosition());
    if (takeLeftPiece != null && takeLeftPiece.color != color) {
      potentialMoves.add(takeLeft.getPosition());
    }
    if (takeRightPiece != null && takeRightPiece.color != color) {
      potentialMoves.add(takeRight.getPosition());
    }

    return potentialMoves;
  }

  @override
  String getLetter() => 'P';
}

class Rook extends Piece {
  Rook({
    @required String id,
    @required Direction direction,
    @required PieceColor color,
  }) : super(id: id, direction: direction, type: PieceType.ROOK, color: color);

  @override
  List<Position> availableMoves(Board board) {
    return _straightMoves(this, board, board.getPiecePosition(this));
  }

  @override
  String getLetter() => 'R';
}

class Knight extends Piece {
  Knight({
    @required String id,
    @required Direction direction,
    @required PieceColor color,
  }) : super(
            id: id, direction: direction, type: PieceType.KNIGHT, color: color);

  @override
  List<Position> availableMoves(Board board) {
    var position = board.getPiecePosition(this);
    var upRight =
        BoardCursor(startPosition: position, board: board, piece: this)
          ..forward()
          ..forward()
          ..right();
    var upLeft = BoardCursor(startPosition: position, board: board, piece: this)
      ..forward()
      ..forward()
      ..left();
    var leftUp = BoardCursor(startPosition: position, board: board, piece: this)
      ..left()
      ..left()
      ..forward();
    var leftDown =
        BoardCursor(startPosition: position, board: board, piece: this)
          ..left()
          ..left()
          ..backward();
    var downRight =
        BoardCursor(startPosition: position, board: board, piece: this)
          ..backward()
          ..backward()
          ..right();
    var downLeft =
        BoardCursor(startPosition: position, board: board, piece: this)
          ..backward()
          ..backward()
          ..left();
    var rightUp =
        BoardCursor(startPosition: position, board: board, piece: this)
          ..right()
          ..right()
          ..forward();
    var rightDown =
        BoardCursor(startPosition: position, board: board, piece: this)
          ..right()
          ..right()
          ..backward();
    var potentialPositions = <Position>[];
    if (upLeft.checkMoves()) potentialPositions.add(upLeft.getPosition());
    if (upRight.checkMoves()) potentialPositions.add(upRight.getPosition());
    if (leftUp.checkMoves()) potentialPositions.add(leftUp.getPosition());
    if (leftDown.checkMoves()) potentialPositions.add(leftDown.getPosition());
    if (rightUp.checkMoves()) potentialPositions.add(rightUp.getPosition());
    if (rightDown.checkMoves()) potentialPositions.add(rightDown.getPosition());
    if (downLeft.checkMoves()) potentialPositions.add(downLeft.getPosition());
    if (downRight.checkMoves()) potentialPositions.add(downRight.getPosition());
    return potentialPositions;
  }

  @override
  String getLetter() => 'K';
}

class Bishop extends Piece {
  Bishop({
    @required String id,
    @required Direction direction,
    @required PieceColor color,
  }) : super(
            id: id, direction: direction, type: PieceType.BISHOP, color: color);

  @override
  List<Position> availableMoves(Board board) {
    return _diagonalMoves(this, board, board.getPiecePosition(this));
  }

  @override
  String getLetter() => 'B';
}

class King extends Piece {
  King({
    @required String id,
    @required Direction direction,
    @required PieceColor color,
  }) : super(id: id, direction: direction, type: PieceType.KING, color: color);

  @override
  List<Position> availableMoves(Board board) {
    var position = board.getPiecePosition(this);
    return _diagonalMoves(this, board, position, limit: 1)
      ..addAll(_straightMoves(this, board, position, limit: 1));
  }

  @override
  String getLetter() => 'G';
}

class Queen extends Piece {
  Queen({
    @required String id,
    @required Direction direction,
    @required PieceColor color,
  }) : super(id: id, direction: direction, type: PieceType.QUEEN, color: color);

  @override
  List<Position> availableMoves(Board board) {
    var position = board.getPiecePosition(this);
    return _diagonalMoves(this, board, position)
      ..addAll(_straightMoves(this, board, position));
  }

  @override
  String getLetter() => 'Q';
}

List<Position> _diagonalMoves(Piece piece, Board board, Position position,
    {int limit = 100}) {
  var potentialPositions = <Position>[];

  var upLeft = BoardCursor(startPosition: position, board: board, piece: piece);
  var upRight =
      BoardCursor(startPosition: position, board: board, piece: piece);
  var downLeft =
      BoardCursor(startPosition: position, board: board, piece: piece);
  var downRight =
      BoardCursor(startPosition: position, board: board, piece: piece);

  while ((upLeft.isActive ||
          upRight.isActive ||
          downLeft.isActive ||
          downRight.isActive) &&
      limit-- > 0) {
    if (upLeft.isActive) {
      upLeft
        ..forward()
        ..left();
      if (upLeft.checkMoves()) {
        potentialPositions.add(upLeft.getPosition());
      }
    }

    if (upRight.isActive) {
      upRight
        ..forward()
        ..right();
      if (upRight.checkMoves()) {
        potentialPositions.add(upRight.getPosition());
      }
    }

    if (downLeft.isActive) {
      downLeft
        ..backward()
        ..left();
      if (downLeft.checkMoves()) {
        potentialPositions.add(downLeft.getPosition());
      }
    }

    if (downRight.isActive) {
      downRight
        ..backward()
        ..right();
      if (downRight.checkMoves()) {
        potentialPositions.add(downRight.getPosition());
      }
    }
  }
  return potentialPositions;
}

List<Position> _straightMoves(Piece piece, Board board, Position position,
    {int limit = 100}) {
  var potentialPositions = <Position>[];

  var up = BoardCursor(startPosition: position, board: board, piece: piece);
  var down = BoardCursor(startPosition: position, board: board, piece: piece);
  var left = BoardCursor(startPosition: position, board: board, piece: piece);
  var right = BoardCursor(startPosition: position, board: board, piece: piece);

  while ((up.isActive || down.isActive || left.isActive || right.isActive) &&
      limit-- > 0) {
    if (up.isActive) {
      up.forward();
      if (up.checkMoves()) {
        potentialPositions.add(up.getPosition());
      }
    }

    if (down.isActive) {
      down.backward();
      if (down.checkMoves()) {
        potentialPositions.add(down.getPosition());
      }
    }

    if (left.isActive) {
      left.left();
      if (left.checkMoves()) {
        potentialPositions.add(left.getPosition());
      }
    }

    if (right.isActive) {
      right.right();
      if (right.checkMoves()) {
        potentialPositions.add(right.getPosition());
      }
    }
  }
  return potentialPositions;
}

class PieceFactory {
  static int _counter = 0;
  static final PieceFactory _instance = PieceFactory._();

  PieceFactory._();

  factory PieceFactory() => _instance;

  List<List<Piece>> generateBoard() {
    return [
      [
        pieceOfColor(Rook, PieceColor.BLACK),
        pieceOfColor(Knight, PieceColor.BLACK),
        pieceOfColor(Bishop, PieceColor.BLACK),
        pieceOfColor(Queen, PieceColor.BLACK),
        pieceOfColor(King, PieceColor.BLACK),
        pieceOfColor(Bishop, PieceColor.BLACK),
        pieceOfColor(Knight, PieceColor.BLACK),
        pieceOfColor(Rook, PieceColor.BLACK),
      ],
      List.generate(BOARD_WIDTH, (_) => pieceOfColor(Pawn, PieceColor.BLACK)),
      List.generate(BOARD_WIDTH, (_) => null),
      List.generate(BOARD_WIDTH, (_) => null),
      List.generate(BOARD_WIDTH, (_) => null),
      List.generate(BOARD_WIDTH, (_) => null),
      List.generate(BOARD_WIDTH, (_) => pieceOfColor(Pawn, PieceColor.WHITE)),
      [
        pieceOfColor(Rook, PieceColor.WHITE),
        pieceOfColor(Knight, PieceColor.WHITE),
        pieceOfColor(Bishop, PieceColor.WHITE),
        pieceOfColor(Queen, PieceColor.WHITE),
        pieceOfColor(King, PieceColor.WHITE),
        pieceOfColor(Bishop, PieceColor.WHITE),
        pieceOfColor(Knight, PieceColor.WHITE),
        pieceOfColor(Rook, PieceColor.WHITE),
      ],
    ];
  }

  Direction whiteDirection = Direction.UP;
  Direction blackDirection = Direction.DOWN;

  Piece pieceOfColor(Type pieceType, PieceColor color) {
    var direction = color == PieceColor.WHITE ? whiteDirection : blackDirection;
    switch (pieceType) {
      case Pawn:
        return Pawn(
            id: (_counter++).toString(), color: color, direction: direction);
      case Rook:
        return Rook(
            id: (_counter++).toString(), color: color, direction: direction);
      case Knight:
        return Knight(
            id: (_counter++).toString(), color: color, direction: direction);
      case Bishop:
        return Bishop(
            id: (_counter++).toString(), color: color, direction: direction);
      case King:
        return King(
            id: (_counter++).toString(), color: color, direction: direction);
      case Queen:
        return Queen(
            id: (_counter++).toString(), color: color, direction: direction);
    }
    throw Exception('Type not rcognized');
  }
}
