import 'package:chess/piece.dart';
import 'package:flutter/material.dart';

const BOARD_WIDTH = 8;

const BOARD_HEIGHT = 8;

class Board {
  List<List<Piece>> _board;

  Board() {
    _board = PieceFactory().generateBoard();
  }

  Board.empty();

  factory Board.fromBoard(Board other) {
    var board = Board.empty();
    board._board = List.generate(BOARD_HEIGHT, (int y) {
      return List.generate(BOARD_WIDTH, (int x) {
        return other._board[y][x];
      });
    });
    return board;
  }

  Piece getAtPosition({int x, int y, Position position}) {
    assert((x == null && y == null) || position == null);
    if (position != null) {
      if (positionIsValid(position)) {
        return _board[position.y][position.x];
      }
      return null;
    }
    if (positionIsValid(Position(x: x, y: y))) {
      return _board[y][x];
    }
    return null;
  }

  void setAtPosition({Piece piece, int x, int y}) {
    _board[y][x] = piece;
  }

  void movePiece(Piece piece, Position toPosition) {
    var position = getPiecePosition(piece);
    setAtPosition(piece: null, x: position.x, y: position.y);
    setAtPosition(piece: piece, x: toPosition.x, y: toPosition.y);
  }

  Position getPiecePosition(Piece piece) {
    for (int x = 0; x < BOARD_WIDTH; x++) {
      for (int y = 0; y < BOARD_HEIGHT; y++) {
        if (piece == getAtPosition(x: x, y: y)) {
          return Position(x: x, y: y);
        }
      }
    }
    throw Exception("Piece should be on board");
  }

  List<Position> availableMoves(Piece piece) {
    if (piece == null) return [];
    var potential = piece.availableMoves(this).where((move) {
      var newBoard = simulate(piece, move);
      return !newBoard.isKingInPeril(piece.color);
    }).toList();

    return potential;
  }

  Board simulate(Piece piece, Position toPosition) {
    var simulated = Board.fromBoard(this);
    simulated.movePiece(piece, toPosition);
    return simulated;
  }

  bool isKingInPeril(PieceColor color) {
    List<Piece> otherPieces = teamPieces(otherColor(color));
    List<Piece> thisPieces = teamPieces(color);
    Piece thisKing = thisPieces.firstWhere((piece) => piece is King);
    Position thisKingPosition = getPiecePosition(thisKing);

    bool kingInPeril = false;
    for (Piece piece in otherPieces) {
      if (piece.availableMoves(this).contains(thisKingPosition)) {
        kingInPeril = true;
        break;
      }
    }
    return kingInPeril;
  }

  List<Piece> teamPieces(PieceColor color) {
    List<Piece> pieces = [];
    for (int x = 0; x < BOARD_HEIGHT; x++) {
      for (int y = 0; y < BOARD_WIDTH; y++) {
        var maybePiece = getAtPosition(x: x, y: y);
        if (maybePiece != null && maybePiece.color == color) {
          pieces.add(maybePiece);
        }
      }
    }
    return pieces;
  }

  bool isCheckMate(PieceColor color) {
    var pieces = teamPieces(color);
    for (Piece piece in pieces) {
      if (availableMoves(piece).length > 0) {
        return false;
      }
    }
    return true;
  }

  bool positionIsValid(Position position) {
    return position.x >= 0 &&
        position.x < BOARD_WIDTH &&
        position.y >= 0 &&
        position.y < BOARD_HEIGHT;
  }

  bool canPieceLandOnPosition(Piece piece, Position position) {
    if (!positionIsValid(position)) return false;
    var newPiece = getAtPosition(x: position.x, y: position.y);
    return newPiece == null || newPiece.color != piece.color;
  }
}

class BoardCursor {
  int x, y;
  final Position startPosition;
  final Board board;
  final Piece piece;
  bool isActive = true;

  BoardCursor({
    @required this.startPosition,
    @required this.board,
    @required this.piece,
  })  : this.x = startPosition.x,
        this.y = startPosition.y;

  // up/down based on visual not impl
  void forward() => piece.direction == Direction.UP ? y-- : y++;

  void backward() => piece.direction == Direction.UP ? y++ : y--;

  void left() => x--;

  void right() => x++;

  bool checkMoves() {
    if (!board.canPieceLandOnPosition(piece, Position(x: x, y: y))) {
      isActive = false;
    }
    if (!isActive) return false;
    var pieceAtPosition = board.getAtPosition(x: x, y: y);
    if (pieceAtPosition != null && pieceAtPosition.color != piece.color) {
      isActive = false;
    }
    return true;
  }

  Position getPosition() => Position(x: x, y: y);
}
