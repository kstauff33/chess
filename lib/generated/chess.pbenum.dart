///
//  Generated code. Do not modify.
//  source: chess.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Event extends $pb.ProtobufEnum {
  static const Event Stalemate = Event._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Stalemate');
  static const Event Move = Event._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Move');
  static const Event PieceTaken = Event._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PieceTaken');
  static const Event PawnReachedEnd = Event._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PawnReachedEnd');
  static const Event Undo = Event._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Undo');
  static const Event ReplacementSelected = Event._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ReplacementSelected');
  static const Event Check = Event._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Check');
  static const Event Checkmate = Event._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Checkmate');
  static const Event NewGame = Event._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NewGame');
  static const Event PlayerJoined = Event._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PlayerJoined');
  static const Event AwaitingPlayer = Event._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AwaitingPlayer');

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
  static Event? valueOf($core.int value) => _byValue[value];

  const Event._($core.int v, $core.String n) : super(v, n);
}

class Piece_Type extends $pb.ProtobufEnum {
  static const Piece_Type KING = Piece_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'KING');
  static const Piece_Type PAWN = Piece_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAWN');
  static const Piece_Type ROOK = Piece_Type._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ROOK');
  static const Piece_Type KNIGHT = Piece_Type._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'KNIGHT');
  static const Piece_Type BISHOP = Piece_Type._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BISHOP');
  static const Piece_Type QUEEN = Piece_Type._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'QUEEN');

  static const $core.List<Piece_Type> values = <Piece_Type> [
    KING,
    PAWN,
    ROOK,
    KNIGHT,
    BISHOP,
    QUEEN,
  ];

  static final $core.Map<$core.int, Piece_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Piece_Type? valueOf($core.int value) => _byValue[value];

  const Piece_Type._($core.int v, $core.String n) : super(v, n);
}

class Piece_Color extends $pb.ProtobufEnum {
  static const Piece_Color BLACK = Piece_Color._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLACK');
  static const Piece_Color WHITE = Piece_Color._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WHITE');

  static const $core.List<Piece_Color> values = <Piece_Color> [
    BLACK,
    WHITE,
  ];

  static final $core.Map<$core.int, Piece_Color> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Piece_Color? valueOf($core.int value) => _byValue[value];

  const Piece_Color._($core.int v, $core.String n) : super(v, n);
}

class Piece_Direction extends $pb.ProtobufEnum {
  static const Piece_Direction DOWN = Piece_Direction._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DOWN');
  static const Piece_Direction UP = Piece_Direction._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UP');

  static const $core.List<Piece_Direction> values = <Piece_Direction> [
    DOWN,
    UP,
  ];

  static final $core.Map<$core.int, Piece_Direction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Piece_Direction? valueOf($core.int value) => _byValue[value];

  const Piece_Direction._($core.int v, $core.String n) : super(v, n);
}

