///
//  Generated code. Do not modify.
//  source: chess.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Event extends $pb.ProtobufEnum {
  static const Event Stalemate = Event._(0, 'Stalemate');
  static const Event Move = Event._(1, 'Move');
  static const Event PieceTaken = Event._(2, 'PieceTaken');
  static const Event PawnReachedEnd = Event._(3, 'PawnReachedEnd');
  static const Event Undo = Event._(4, 'Undo');
  static const Event ReplacementSelected = Event._(5, 'ReplacementSelected');
  static const Event Check = Event._(6, 'Check');
  static const Event Checkmate = Event._(7, 'Checkmate');
  static const Event NewGame = Event._(8, 'NewGame');
  static const Event PlayerJoined = Event._(9, 'PlayerJoined');
  static const Event AwaitingPlayer = Event._(10, 'AwaitingPlayer');

  static const $core.List<Event> values = <Event> [
    Stalemate,
    Move,
    PieceTaken,
    PawnReachedEnd,
    Undo,
    ReplacementSelected,
    Check,
    Checkmate,
    NewGame,
    PlayerJoined,
    AwaitingPlayer,
  ];

  static final $core.Map<$core.int, Event> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Event valueOf($core.int value) => _byValue[value];

  const Event._($core.int v, $core.String n) : super(v, n);
}

class Piece_Type extends $pb.ProtobufEnum {
  static const Piece_Type KING = Piece_Type._(0, 'KING');
  static const Piece_Type PAWN = Piece_Type._(1, 'PAWN');
  static const Piece_Type ROOK = Piece_Type._(2, 'ROOK');
  static const Piece_Type KNIGHT = Piece_Type._(3, 'KNIGHT');
  static const Piece_Type BISHOP = Piece_Type._(4, 'BISHOP');
  static const Piece_Type QUEEN = Piece_Type._(5, 'QUEEN');

  static const $core.List<Piece_Type> values = <Piece_Type> [
    KING,
    PAWN,
    ROOK,
    KNIGHT,
    BISHOP,
    QUEEN,
  ];

  static final $core.Map<$core.int, Piece_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Piece_Type valueOf($core.int value) => _byValue[value];

  const Piece_Type._($core.int v, $core.String n) : super(v, n);
}

class Piece_Color extends $pb.ProtobufEnum {
  static const Piece_Color BLACK = Piece_Color._(0, 'BLACK');
  static const Piece_Color WHITE = Piece_Color._(1, 'WHITE');

  static const $core.List<Piece_Color> values = <Piece_Color> [
    BLACK,
    WHITE,
  ];

  static final $core.Map<$core.int, Piece_Color> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Piece_Color valueOf($core.int value) => _byValue[value];

  const Piece_Color._($core.int v, $core.String n) : super(v, n);
}

class Piece_Direction extends $pb.ProtobufEnum {
  static const Piece_Direction DOWN = Piece_Direction._(0, 'DOWN');
  static const Piece_Direction UP = Piece_Direction._(1, 'UP');

  static const $core.List<Piece_Direction> values = <Piece_Direction> [
    DOWN,
    UP,
  ];

  static final $core.Map<$core.int, Piece_Direction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Piece_Direction valueOf($core.int value) => _byValue[value];

  const Piece_Direction._($core.int v, $core.String n) : super(v, n);
}

