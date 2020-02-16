import 'package:chess/model/events.dart';
import 'package:chess/model/piece.dart';
import 'package:chess/utils.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../model/board.dart';

class BoardProvider extends InheritedWidget {
  final BoardBloc boardBloc;

  BoardProvider({this.boardBloc, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static BoardBloc of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<BoardProvider>().boardBloc;
}

class BoardBloc {
  final double squareSize;
  final Game game;
  Piece selectedPiece;

  BoardBloc({
    @required this.squareSize,
    @required this.game,
  });

  /// A square can be selected if:
  ///   1) there is no existing selection or
  ///       the selection is a piece belonging to the current team (select)
  ///   2) the existing selection is the same as the selectiong (unselect)
  ///   3) the target is a valid target for the current selection (move/take)
  void selectSquare(Position position) {
    var maybePiece = game.board.getAtPosition(x: position.x, y: position.y);

    // short circuit if there is no action to take (skip non-moves)
    if ((maybePiece == null || maybePiece.color != game.turn) &&
        selectedPiece == null) return;

    if (selectedPiece == null || selectedPiece.color == maybePiece?.color) {
      selectedPiece = maybePiece;
      game.gameEvent.add(SquareSelected(piece: maybePiece, position: position));
    } else if (selectedPiece == maybePiece) {
      selectedPiece = null;
      game.gameEvent
          .add(SquareDeSelected(piece: maybePiece, position: position));
    } else if (game.board.availableMoves(selectedPiece).contains(position)) {
      game.movePiece(maybePiece, position);
      selectedPiece = null;
    }
  }
}

class Game {
  final Board board;
  final List<GameEvent> events = [];

  PieceColor turn = PieceColor.WHITE;

  BehaviorSubject<GameEvent> gameEvent = BehaviorSubject<GameEvent>();

  Game() : board = Board() {
    gameEvent.listen((event) {
      events.add(event);
    });
  }

  void movePiece(Piece piece, Position position) {
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
