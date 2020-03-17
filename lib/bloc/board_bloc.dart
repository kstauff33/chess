import 'package:chess/model/events.dart';
import 'package:chess/model/game.dart';
import 'package:chess/model/piece.dart';
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
  Game game;
  Piece selectedPiece;
  BehaviorSubject<GameEvent> events = BehaviorSubject<GameEvent>();

  BoardBloc({@required this.squareSize, Game game}) {
    newGame(game);
  }

  void newGame(Game game) {
    this.game = game;
    selectedPiece = null;
    game.gameEvent.listen((event) {
      if (event is Undo) {
        selectedPiece = null;
      }
      events.add(event);
    });
    events.add(NewGame());
  }

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
      game.movePiece(selectedPiece, position);
      selectedPiece = null;
    }
  }
}
