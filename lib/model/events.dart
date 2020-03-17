import 'package:meta/meta.dart';

import 'board.dart';
import 'piece.dart';
import 'utils.dart';

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
    return '${colorAsString(loser)} is in Checkmate. ${colorAsString(otherColor(loser))} Wins!';
  }
}

class Stalemate extends GameEvent {
  @override
  String getDescription() {
    return "Stalemate! It's a draw!";
  }
}

class NewGame extends GameEvent {
  @override
  String getDescription() {
    return 'New game';
  }
}

class AwaitingPlayer extends GameEvent {
  @override
  String getDescription() {
    return 'Waiting for an opponent';
  }
}

class PlayerJoined extends GameEvent {
  @override
  String getDescription() {
    return 'A contender has arrived';
  }
}
