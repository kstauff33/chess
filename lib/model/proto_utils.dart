// import '../generated/chess.pbgrpc.dart' as grpc;
// import 'board.dart';
// import 'events.dart';
// import 'piece.dart';

// grpc.Board boardToProto(Board board) {
//   var rows = List.generate(BOARD_HEIGHT, (y) {
//     var rowPieces = List.generate(BOARD_WIDTH, (x) {
//       var square = grpc.Square.create();
//       var maybePiece = board.getAtPosition(x: x, y: y);
//       if (maybePiece != null) {
//         square
//           ..empty = false
//           ..piece = pieceToProto(board.getAtPosition(x: x, y: y))!;
//       } else {
//         square.empty = true;
//       }
//       return square;
//     });
//     return grpc.Row.create()..squares.addAll(rowPieces);
//   });
//   return grpc.Board.create()..rows.addAll(rows);
// }

// grpc.Piece? pieceToProto(Piece? piece) {
//   if (piece == null) return null;
//   return grpc.Piece.create()
//     ..id = piece.id
//     ..color = colorToProto(piece.color)
//     ..type = typeToProto(piece.type)
//     ..direction = directionToProto(piece.direction);
// }

// grpc.Piece_Direction directionToProto(Direction direction) {
//   if (direction == Direction.UP) {
//     return grpc.Piece_Direction.UP;
//   }
//   return grpc.Piece_Direction.DOWN;
// }

// grpc.Piece_Color colorToProto(PieceColor color) {
//   if (color == PieceColor.WHITE) {
//     return grpc.Piece_Color.WHITE;
//   }
//   return grpc.Piece_Color.BLACK;
// }

// grpc.Piece_Type typeToProto(PieceType type) {
//   switch (type) {
//     case PieceType.BISHOP:
//       return grpc.Piece_Type.BISHOP;
//     case PieceType.PAWN:
//       return grpc.Piece_Type.PAWN;
//     case PieceType.ROOK:
//       return grpc.Piece_Type.PAWN;
//     case PieceType.KNIGHT:
//       return grpc.Piece_Type.KNIGHT;
//     case PieceType.QUEEN:
//       return grpc.Piece_Type.QUEEN;
//     case PieceType.KING:
//       return grpc.Piece_Type.KING;
//   }
//   throw Exception('Type not recognized');
// }

// grpc.Event eventToProto(GameEvent event) {
//   switch (event.runtimeType) {
//     case Stalemate:
//       return grpc.Event.Stalemate;
//     case Move:
//       return grpc.Event.Move;
//     case PieceTaken:
//       return grpc.Event.PieceTaken;
//     case PawnReachedEnd:
//       return grpc.Event.PawnReachedEnd;
//     case Undo:
//       return grpc.Event.Undo;
//     case ReplacementSelected:
//       return grpc.Event.ReplacementSelected;
//     case Check:
//       return grpc.Event.Check;
//     case Checkmate:
//       return grpc.Event.Checkmate;
//     case NewGame:
//       return grpc.Event.NewGame;
//     case PlayerJoined:
//       return grpc.Event.PlayerJoined;
//     case AwaitingPlayer:
//       return grpc.Event.AwaitingPlayer;
//   }
//   throw Exception('Event not recognized: $event');
// }

// GameEvent eventFromProto(grpc.Event event) {
//   switch (event) {
//     case grpc.Event.Undo:
//       return Undo();
//     case grpc.Event.Stalemate:
//       return Stalemate();
//     case grpc.Event.Move:
//       return Move();
//     case grpc.Event.PieceTaken:
//       return PieceTaken();
//     case grpc.Event.PawnReachedEnd:
//       return PawnReachedEnd();
//     case grpc.Event.ReplacementSelected:
//       return ReplacementSelected();
//     case grpc.Event.Check:
//       return Check();
//     case grpc.Event.Checkmate:
//       return Checkmate();
//     case grpc.Event.NewGame:
//       return NewGame();
//     case grpc.Event.PlayerJoined:
//       return PlayerJoined();
//     case grpc.Event.AwaitingPlayer:
//       return AwaitingPlayer();
//   }
//   throw Exception('Event not recognized: $event');
// }

// PieceType typeFromProto(grpc.Piece_Type type) {
//   switch (type) {
//     case grpc.Piece_Type.BISHOP:
//       return PieceType.BISHOP;
//     case grpc.Piece_Type.PAWN:
//       return PieceType.PAWN;
//     case grpc.Piece_Type.ROOK:
//       return PieceType.ROOK;
//     case grpc.Piece_Type.KNIGHT:
//       return PieceType.KNIGHT;
//     case grpc.Piece_Type.QUEEN:
//       return PieceType.QUEEN;
//     case grpc.Piece_Type.KING:
//       return PieceType.KING;
//   }
//   throw Exception('Type not recognized');
// }

// Type typeFromPieceType(PieceType type) {
//   switch (type) {
//     case PieceType.BISHOP:
//       return Bishop;
//     case PieceType.PAWN:
//       return Pawn;
//     case PieceType.ROOK:
//       return Rook;
//     case PieceType.KNIGHT:
//       return Knight;
//     case PieceType.QUEEN:
//       return Queen;
//     case PieceType.KING:
//       return King;
//   }
//   throw Exception('Type not recognized');
// }

// PieceColor colorFromProto(grpc.Piece_Color color) {
//   switch (color) {
//     case grpc.Piece_Color.WHITE:
//       return PieceColor.WHITE;
//     case grpc.Piece_Color.BLACK:
//       return PieceColor.BLACK;
//   }
//   throw Exception('Color not recognized');
// }

// Piece pieceFromProto(grpc.Piece piece) {
//   if (piece == null) return null;
//   return PieceFactory().pieceOfColor(
//       typeFromPieceType(typeFromProto(piece.type)), colorFromProto(piece.color),
//       id: piece.id);
// }
