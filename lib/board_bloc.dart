import 'package:chess/piece.dart';
import 'package:chess/utils.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'board.dart';

class BoardProvider extends InheritedWidget {
  final BoardBloc boardBloc;

  BoardProvider({this.boardBloc, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static BoardBloc of(BuildContext context) =>
      (context.ancestorWidgetOfExactType(BoardProvider) as BoardProvider)
          .boardBloc;
}

class BoardBloc {
  final double squareSize;
  final Board board;
  final List<GameEvent> events = [];

  Piece selectedPiece;
  PieceColor turn = PieceColor.WHITE;

  BehaviorSubject<GameEvent> gameEvent = BehaviorSubject<GameEvent>();

  BoardBloc({@required this.squareSize}) : board = Board() {
    gameEvent.listen((event) {
      events.add(event);
    });
  }

  /// A square can be selected if:
  ///   1) there is no existing selection or
  ///       the selection is a piece belonging to the current team (select)
  ///   2) the existing selection is the same as the selectiong (unselect)
  ///   3) the target is a valid target for the current selection (move/take)
  void selectSquare(Position position) {
    var maybePiece = board.getAtPosition(x: position.x, y: position.y);

    // short circuit if there is no action to take (skip non-moves)
    if ((maybePiece == null || maybePiece.color != turn) &&
        selectedPiece == null) return;

    if (selectedPiece == null || selectedPiece.color == maybePiece?.color) {
      selectedPiece = maybePiece;
      gameEvent.add(SquareSelected(piece: maybePiece, position: position));
    } else if (selectedPiece == maybePiece) {
      selectedPiece = null;
      gameEvent.add(SquareDeSelected(piece: maybePiece, position: position));
    } else if (board.availableMoves(selectedPiece).contains(position)) {
      _movePiece(maybePiece, position);
      selectedPiece = null;
    }
  }

  void _movePiece(Piece piece, Position position) {
    turn = otherColor(turn);

    print(
        'Move($piece, $position) from: ${board.getPiecePosition(selectedPiece)}');
    if (piece != null && piece.color != selectedPiece.color) {
      gameEvent.add(PieceTaken(
        to: position,
        pieceMoved: selectedPiece,
        from: board.getPiecePosition(selectedPiece),
        pieceTaken: board.getAtPosition(position: position),
      ));
    } else {
      gameEvent.add(Move(
        to: position,
        pieceMoved: selectedPiece,
        from: board.getPiecePosition(selectedPiece),
      ));
    }

    board.movePiece(selectedPiece, position);

    if (board.isCheckMate(turn)) {
      gameEvent.add(Checkmate(loser: turn));
    } else if (board.isStaleMate(turn)) {
      gameEvent.add(Stalemate());
    } else if (board.isKingInPeril(turn)) {
      gameEvent.add(Check(colorInCheck: turn));
    }

    if (selectedPiece is Pawn) {
      (selectedPiece as Pawn).hasMoved = true;
      if (selectedPiece.direction == Direction.UP && position.y == 0 ||
          selectedPiece.direction == Direction.DOWN &&
              position.y == BOARD_HEIGHT - 1) {
        gameEvent.add(PawnReachedEnd(piece: selectedPiece));
      }
    }
  }

  void replacePawn(Pawn pawn, Type replacementType) {
    var position = board.getPiecePosition(pawn);
    var replacement = PieceFactory().pieceOfColor(replacementType, pawn.color);
    board.setAtPosition(piece: replacement, x: position.x, y: position.y);
    gameEvent.add(ReplacementSelected(selectedType: replacementType));
  }

  void undo() {
    var move = events.reversed.firstWhere((event) => event is Move) as Move;
    events.removeRange(events.indexOf(move), events.length);

    // reverse the move
    board.setAtPosition(piece: move.pieceMoved, position: move.from);

    // reset taken piece
    if (move is PieceTaken) {
      board.setAtPosition(piece: move.pieceTaken, position: move.to);
    } else {
      board.setAtPosition(piece: null, position: move.to);
    }

    if (move.pieceMoved is Pawn) {
      // reset pawn if back to start position
      if ((move.pieceMoved.direction == Direction.DOWN && move.from.y == 1) ||
          (move.pieceMoved.direction == Direction.UP &&
              move.from.y == BOARD_HEIGHT - 2)) {
        (move.pieceMoved as Pawn).hasMoved = false;
//      } else if ((move.to.y == 0 || move.to.y == BOARD_HEIGHT - 1) &&
//          move is! PieceTaken) {
//        // reset pawn if replaced and square not overwritten by taken piece
//        board.setAtPosition(piece: null, x: move.to.x, y: move.to.y);
      }
    }

    selectedPiece = null;
    turn = move.pieceMoved.color;
    gameEvent.add(Undo(move: move));
  }

  void dispose() {
    gameEvent.close();
  }
}

abstract class GameEvent {
  String getDescription();
}

class SquareSelected extends GameEvent {
  final Position position;
  final Piece piece;

  SquareSelected({this.position, this.piece});

  @override
  String getDescription() {
    return 'Position: $position selected';
  }
}

class SquareDeSelected extends SquareSelected {
  SquareDeSelected({
    @required Position position,
    @required Piece piece,
  }) : super(position: position, piece: piece);

  @override
  String getDescription() {
    return 'Position: $position deselected';
  }
}

class Move extends GameEvent {
  final Piece pieceMoved;
  final Position from;
  final Position to;

  Move({
    @required this.pieceMoved,
    @required this.from,
    @required this.to,
  });

  @override
  String getDescription() {
    return 'Moved piece: $pieceMoved from $from to $to';
  }
}

class PieceTaken extends Move {
  final Piece pieceTaken;

  PieceTaken({
    @required to,
    @required from,
    @required pieceMoved,
    @required this.pieceTaken,
  }) : super(pieceMoved: pieceMoved, from: from, to: to);

  @override
  String getDescription() {
    return super.getDescription() + ', taking $pieceTaken';
  }
}

class PawnReachedEnd extends GameEvent {
  final Pawn piece;

  PawnReachedEnd({@required this.piece});

  @override
  String getDescription() {
    return '${colorAsString(piece.color)} pawn reached the end';
  }
}

class Undo extends GameEvent {
  final Move move;

  Undo({@required this.move});

  @override
  String getDescription() {
    return 'Move undone';
  }
}

class ReplacementSelected extends GameEvent {
  final Type selectedType;

  ReplacementSelected({@required this.selectedType});

  @override
  String getDescription() {
    return 'Chose $selectedType as replacement';
  }
}

class Check extends GameEvent {
  final PieceColor colorInCheck;

  Check({@required this.colorInCheck});

  @override
  String getDescription() {
    return "${colorAsString(colorInCheck)}'s King is in check";
  }
}

class Checkmate extends GameEvent {
  final PieceColor loser;

  Checkmate({@required this.loser});

  @override
  String getDescription() {
    return "${colorAsString(loser)} is in Checkmate. ${colorAsString(otherColor(loser))} Wins!";
  }
}

class Stalemate extends GameEvent {
  @override
  String getDescription() {
    return "Stalemate! It's a draw!";
  }
}
