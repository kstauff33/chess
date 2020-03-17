import 'package:meta/meta.dart';

import 'piece.dart';
import 'utils.dart';

const BOARD_WIDTH = 8;

const BOARD_HEIGHT = 8;

class Position {
  final int x, y;

  const Position({@required this.x, this.y});

  @override
  int get hashCode => x + 1 + 10 * (y + 1);

  @override
  bool operator ==(other) {
    if (other is! Position) return false;
    return x == other.x && y == other.y;
  }

  @override
  String toString() {
    return '(x: $x, y: $y)';
  }
}

class BoardCache {
  bool availableMovesDirty = true;
  bool kingInPerilDirty = true;
  bool teamPiecesDirty = true;

  bool _movesAvailable;
  bool _kingInPeril;
  Map<PieceColor, List<Piece>> _teamPieces;

  bool get movesAvailable => _movesAvailable;

  set movesAvailable(bool available) {
    _movesAvailable = available;
    availableMovesDirty = false;
  }

  bool get kingInPeril => _kingInPeril;

  set kingInPeril(bool inPeril) {
    _kingInPeril = inPeril;
    kingInPerilDirty = false;
  }

  Map<PieceColor, List<Piece>> get teamPieces => _teamPieces;

  void setTeamPieces(PieceColor color, List<Piece> pieces) {
    _teamPieces[color] = pieces;
    teamPiecesDirty = false;
  }

  void invalidate() {
    availableMovesDirty = true;
    kingInPerilDirty = true;
    teamPiecesDirty = true;
    _teamPieces = {};
  }
}

class Board {
  List<List<Piece>> _board;

  BoardCache cache = BoardCache();

  Board() {
    _board = PieceFactory().generateBoard();
  }

  @override
  String toString() {
    return _board.map((row) {
      return row.map((piece) => piece?.getLetter() ?? ' ').join(', ');
    }).join('\n');
  }

  Board.empty() {
    _board = List.generate(BOARD_HEIGHT, (int y) {
      return List.generate(BOARD_WIDTH, (int x) {
        return null;
      });
    });
  }

  factory Board.fromBoard(Board other) {
    var board = Board.empty();
    board._board = List.generate(BOARD_HEIGHT, (int y) {
      return List.generate(BOARD_WIDTH, (int x) {
        return other._board[y][x];
      });
    });
    return board;
  }

  /// Get the piece at the provided location
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

  /// Place a piece at the provided location
  void setAtPosition({Piece piece, int x, int y, Position position}) {
    cache.invalidate();
    assert((x == null && y == null) || position == null);
    if (position != null) {
      _board[position.y][position.x] = piece;
    } else {
      _board[y][x] = piece;
    }
  }

  /// Place the piece at the provided position and clear the previous placement
  void movePiece(Piece piece, Position toPosition) {
    var position = getPiecePosition(piece);
    setAtPosition(piece: null, x: position.x, y: position.y);
    setAtPosition(piece: piece, x: toPosition.x, y: toPosition.y);
  }

  /// Given a piece, find it's position on the board
  Position getPiecePosition(Piece piece) {
    for (var x = 0; x < BOARD_WIDTH; x++) {
      for (var y = 0; y < BOARD_HEIGHT; y++) {
        if (piece == getAtPosition(x: x, y: y)) {
          return Position(x: x, y: y);
        }
      }
    }
    throw Exception('Piece should be on board');
  }

  /// Get a reference to a given piece based on the supplied id
  Piece findPieceById(String id) {
    print('find piece by id');
    for (var x = 0; x < BOARD_WIDTH; x++) {
      for (var y = 0; y < BOARD_HEIGHT; y++) {
        var maybePiece = getAtPosition(x: x, y: y);
        if (maybePiece != null && maybePiece.id == id) {
          return maybePiece;
        }
      }
    }
    throw Exception('Piece should be on board');
  }

  /// Find all potential destination positions for a given piece
  List<Position> availableMoves(Piece piece) {
    if (piece == null) return [];
    var potential = piece.availableMoves(this).where((move) {
      var newBoard = simulate(piece, move);
      return !newBoard.isKingInPeril(piece.color);
    }).toList();

    return potential;
  }

  /// Create a new board having moved @param piece to @param toPosition
  Board simulate(Piece piece, Position toPosition) {
    var simulated = Board.fromBoard(this);
    simulated.movePiece(piece, toPosition);
    return simulated;
  }

  /// Determine if the King is in check (any piece from the opposite
  /// @param color could take it)
  bool isKingInPeril(PieceColor color) {
    if (!cache.kingInPerilDirty) return cache.kingInPeril;
    var otherPieces = teamPieces(otherColor(color));
    var thisPieces = teamPieces(color);
    var thisKing = thisPieces.firstWhere((piece) => piece is King);
    var thisKingPosition = getPiecePosition(thisKing);

    var kingInPeril = false;
    for (var piece in otherPieces) {
      if (piece.availableMoves(this).contains(thisKingPosition)) {
        kingInPeril = true;
        break;
      }
    }
    cache.kingInPeril = kingInPeril;
    return kingInPeril;
  }

  /// Find all pieces on the board for a given color
  List<Piece> teamPieces(PieceColor color) {
    if (!cache.teamPiecesDirty && cache.teamPieces.containsKey(color)) {
      return cache.teamPieces[color];
    }
    var pieces = <Piece>[];
    for (var x = 0; x < BOARD_HEIGHT; x++) {
      for (var y = 0; y < BOARD_WIDTH; y++) {
        var maybePiece = getAtPosition(x: x, y: y);
        if (maybePiece != null && maybePiece.color == color) {
          pieces.add(maybePiece);
        }
      }
    }
    cache.teamPieces[color] = pieces;
    return pieces;
  }

  /// No moves available that get the king out of check
  bool isCheckMate(PieceColor color) {
    return !hasAvailableMoves(color) && isKingInPeril(color);
  }

  /// King is safe, but no moves are possible
  bool isStaleMate(PieceColor color) {
    return !hasAvailableMoves(color) && !isKingInPeril(color);
  }

  /// Whether there are any available moves to be made
  bool hasAvailableMoves(PieceColor color) {
    if (!cache.availableMovesDirty) return cache.movesAvailable;
    var pieces = teamPieces(color);
    var available = false;
    for (var piece in pieces) {
      if (availableMoves(piece).isNotEmpty) {
        available = true;
        break;
      }
    }
    cache.movesAvailable = available;
    return available;
  }

  /// Check if a position is within the bounds of the board
  bool positionIsValid(Position position) {
    return position.x >= 0 &&
        position.x < BOARD_WIDTH &&
        position.y >= 0 &&
        position.y < BOARD_HEIGHT;
  }

  /// Determine if the piece is theoretically able to move to a given piece
  /// based on destination characteristics
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
    this.startPosition,
    this.board,
    this.piece,
  })  : x = startPosition.x,
        y = startPosition.y;

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
