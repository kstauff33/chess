import 'package:grpc/grpc.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../generated/chess.pbgrpc.dart' as proto;
import '../model/proto_utils.dart';
import 'board.dart';
import 'events.dart';
import 'piece.dart';
import 'utils.dart';

abstract class Game {
  String id;
  Board board;
  final List<GameEvent> events = [];
  final BehaviorSubject<GameEvent> gameEvent = BehaviorSubject<GameEvent>();

  PieceColor turn = PieceColor.WHITE;

  Game({@required this.board, this.id});

  void movePiece(Piece pieceToMove, Position toPosition);

  void replacePawn(Pawn pawn, Type replacementType);

  void undo();
}

class LocalGame extends Game {
  @override
  LocalGame({String id}) : super(board: Board(), id: id) {
    gameEvent.listen((event) {
      events.add(event);
    });
  }

  @override
  void movePiece(Piece pieceToMove, Position toPosition) {
    _validateMove(pieceToMove, toPosition);
    var destinationPiece = board.getAtPosition(position: toPosition);
    var fromPosition = board.getPiecePosition(pieceToMove);

    turn = otherColor(turn);

    board.movePiece(pieceToMove, toPosition);

    if (destinationPiece != null &&
        pieceToMove.color != destinationPiece.color) {
      gameEvent.add(PieceTaken(
        to: toPosition,
        pieceMoved: pieceToMove,
        from: fromPosition,
        pieceTaken: destinationPiece,
      ));
    } else {
      gameEvent.add(Move(
        to: toPosition,
        pieceMoved: pieceToMove,
        from: fromPosition,
      ));
    }

    if (board.isCheckMate(turn)) {
      gameEvent.add(Checkmate(loser: turn));
    } else if (board.isStaleMate(turn)) {
      gameEvent.add(Stalemate());
    } else if (board.isKingInPeril(turn)) {
      gameEvent.add(Check(colorInCheck: turn));
    }

    if (pieceToMove is Pawn) {
      pieceToMove.hasMoved = true;
      if (pieceToMove.direction == Direction.UP && toPosition.y == 0 ||
          pieceToMove.direction == Direction.DOWN &&
              toPosition.y == BOARD_HEIGHT - 1) {
        gameEvent.add(PawnReachedEnd(piece: pieceToMove));
      }
    }
  }

  @override
  void replacePawn(Pawn pawn, Type replacementType) {
    var position = board.getPiecePosition(pawn);
    var replacement = PieceFactory().pieceOfColor(replacementType, pawn.color);
    board.setAtPosition(piece: replacement, x: position.x, y: position.y);
    gameEvent.add(ReplacementSelected(selectedType: replacementType));
  }

  @override
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

    turn = move.pieceMoved.color;
    gameEvent.add(Undo(move: move));
  }

  void dispose() {
    gameEvent.close();
  }

  void _validateMove(Piece pieceToMove, Position toPosition) {
    if (pieceToMove == null ||
        toPosition == null ||
        turn != pieceToMove.color ||
        !board.availableMoves(pieceToMove).contains(toPosition)) {
      throw Exception('Invalid move');
    }
  }
}

class RemoteGame extends Game {
  RemoteGame() : stub = proto.GameClient(channel) {
    board = Board.empty();
    var responseStream = stub.gameState(proto.JoinGameRequest.create());
    responseStream.listen(_onResponse);
  }

  void _onResponse(proto.GameUpdateResponse response) {
    board = Board.empty();
    id = response.gameId;
    turn = colorFromProto(response.turn);
    for (var y = 0; y < response.board.rows.length; y++) {
      var row = response.board.rows[y];
      for (var x = 0; x < row.squares.length; x++) {
        if (!row.squares[x].empty) {
          board.setAtPosition(
              x: x, y: y, piece: pieceFromProto(row.squares[x].piece));
        }
      }
    }
    print(board);
    print('Add event: ${eventFromProto(response.lastEvent)}');
    gameEvent.add(eventFromProto(response.lastEvent));
  }

  @override
  void movePiece(Piece pieceToMove, Position toPosition) {
    print('move Piece');
    var position = proto.Position.create()
      ..x = toPosition.x
      ..y = toPosition.y;
    stub.makeMove(proto.MakeMoveRequest.create()
      ..gameId = id
      ..piece = pieceToProto(pieceToMove)
      ..to = position);
  }

  @override
  void replacePawn(Pawn pawn, Type replacementType) {
    // TODO: implement replacePawn
  }

  @override
  void undo() {
    // TODO: implement undo
  }

  static final channel = ClientChannel(
    '192.168.86.198',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final proto.GameClient stub;
}

class Client {
  void movePiece(Piece pieceToMove, Position toPosition) {}
}
