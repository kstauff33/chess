///
//  Generated code. Do not modify.
//  source: chess.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'chess.pbenum.dart';

export 'chess.pbenum.dart';

class Board extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Board', createEmptyInstance: create)
    ..pc<Row>(1, 'rows', $pb.PbFieldType.PM, subBuilder: Row.create)
    ..hasRequiredFields = false
  ;

  Board._() : super();
  factory Board() => create();
  factory Board.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Board.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Board clone() => Board()..mergeFromMessage(this);
  Board copyWith(void Function(Board) updates) => super.copyWith((message) => updates(message as Board));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Board create() => Board._();
  Board createEmptyInstance() => create();
  static $pb.PbList<Board> createRepeated() => $pb.PbList<Board>();
  static Board getDefault() => _defaultInstance ??= create()..freeze();
  static Board _defaultInstance;

  $core.List<Row> get rows => $_getList(0);
}

class Row extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Row', createEmptyInstance: create)
    ..pc<Square>(1, 'squares', $pb.PbFieldType.PM, subBuilder: Square.create)
    ..hasRequiredFields = false
  ;

  Row._() : super();
  factory Row() => create();
  factory Row.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Row.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Row clone() => Row()..mergeFromMessage(this);
  Row copyWith(void Function(Row) updates) => super.copyWith((message) => updates(message as Row));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Row create() => Row._();
  Row createEmptyInstance() => create();
  static $pb.PbList<Row> createRepeated() => $pb.PbList<Row>();
  static Row getDefault() => _defaultInstance ??= create()..freeze();
  static Row _defaultInstance;

  $core.List<Square> get squares => $_getList(0);
}

class Square extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Square', createEmptyInstance: create)
    ..a<Piece>(1, 'piece', $pb.PbFieldType.OM, defaultOrMaker: Piece.getDefault, subBuilder: Piece.create)
    ..aOB(2, 'empty')
    ..hasRequiredFields = false
  ;

  Square._() : super();
  factory Square() => create();
  factory Square.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Square.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Square clone() => Square()..mergeFromMessage(this);
  Square copyWith(void Function(Square) updates) => super.copyWith((message) => updates(message as Square));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Square create() => Square._();
  Square createEmptyInstance() => create();
  static $pb.PbList<Square> createRepeated() => $pb.PbList<Square>();
  static Square getDefault() => _defaultInstance ??= create()..freeze();
  static Square _defaultInstance;

  Piece get piece => $_getN(0);
  set piece(Piece v) { setField(1, v); }
  $core.bool hasPiece() => $_has(0);
  void clearPiece() => clearField(1);

  $core.bool get empty => $_get(1, false);
  set empty($core.bool v) { $_setBool(1, v); }
  $core.bool hasEmpty() => $_has(1);
  void clearEmpty() => clearField(2);
}

class Piece extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Piece', createEmptyInstance: create)
    ..e<Piece_Type>(1, 'type', $pb.PbFieldType.OE, defaultOrMaker: Piece_Type.KING, valueOf: Piece_Type.valueOf, enumValues: Piece_Type.values)
    ..e<Piece_Color>(2, 'color', $pb.PbFieldType.OE, defaultOrMaker: Piece_Color.BLACK, valueOf: Piece_Color.valueOf, enumValues: Piece_Color.values)
    ..e<Piece_Direction>(3, 'direction', $pb.PbFieldType.OE, defaultOrMaker: Piece_Direction.DOWN, valueOf: Piece_Direction.valueOf, enumValues: Piece_Direction.values)
    ..aOS(4, 'id')
    ..hasRequiredFields = false
  ;

  Piece._() : super();
  factory Piece() => create();
  factory Piece.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Piece.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Piece clone() => Piece()..mergeFromMessage(this);
  Piece copyWith(void Function(Piece) updates) => super.copyWith((message) => updates(message as Piece));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Piece create() => Piece._();
  Piece createEmptyInstance() => create();
  static $pb.PbList<Piece> createRepeated() => $pb.PbList<Piece>();
  static Piece getDefault() => _defaultInstance ??= create()..freeze();
  static Piece _defaultInstance;

  Piece_Type get type => $_getN(0);
  set type(Piece_Type v) { setField(1, v); }
  $core.bool hasType() => $_has(0);
  void clearType() => clearField(1);

  Piece_Color get color => $_getN(1);
  set color(Piece_Color v) { setField(2, v); }
  $core.bool hasColor() => $_has(1);
  void clearColor() => clearField(2);

  Piece_Direction get direction => $_getN(2);
  set direction(Piece_Direction v) { setField(3, v); }
  $core.bool hasDirection() => $_has(2);
  void clearDirection() => clearField(3);

  $core.String get id => $_getS(3, '');
  set id($core.String v) { $_setString(3, v); }
  $core.bool hasId() => $_has(3);
  void clearId() => clearField(4);
}

class Position extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Position', createEmptyInstance: create)
    ..a<$core.int>(1, 'x', $pb.PbFieldType.O3)
    ..a<$core.int>(2, 'y', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Position._() : super();
  factory Position() => create();
  factory Position.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Position.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Position clone() => Position()..mergeFromMessage(this);
  Position copyWith(void Function(Position) updates) => super.copyWith((message) => updates(message as Position));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Position create() => Position._();
  Position createEmptyInstance() => create();
  static $pb.PbList<Position> createRepeated() => $pb.PbList<Position>();
  static Position getDefault() => _defaultInstance ??= create()..freeze();
  static Position _defaultInstance;

  $core.int get x => $_get(0, 0);
  set x($core.int v) { $_setSignedInt32(0, v); }
  $core.bool hasX() => $_has(0);
  void clearX() => clearField(1);

  $core.int get y => $_get(1, 0);
  set y($core.int v) { $_setSignedInt32(1, v); }
  $core.bool hasY() => $_has(1);
  void clearY() => clearField(2);
}

class JoinGameRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('JoinGameRequest', createEmptyInstance: create)
    ..aOS(1, 'gameId', protoName: 'gameId')
    ..hasRequiredFields = false
  ;

  JoinGameRequest._() : super();
  factory JoinGameRequest() => create();
  factory JoinGameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinGameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  JoinGameRequest clone() => JoinGameRequest()..mergeFromMessage(this);
  JoinGameRequest copyWith(void Function(JoinGameRequest) updates) => super.copyWith((message) => updates(message as JoinGameRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoinGameRequest create() => JoinGameRequest._();
  JoinGameRequest createEmptyInstance() => create();
  static $pb.PbList<JoinGameRequest> createRepeated() => $pb.PbList<JoinGameRequest>();
  static JoinGameRequest getDefault() => _defaultInstance ??= create()..freeze();
  static JoinGameRequest _defaultInstance;

  $core.String get gameId => $_getS(0, '');
  set gameId($core.String v) { $_setString(0, v); }
  $core.bool hasGameId() => $_has(0);
  void clearGameId() => clearField(1);
}

class GameUpdateResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GameUpdateResponse', createEmptyInstance: create)
    ..a<Board>(1, 'board', $pb.PbFieldType.OM, defaultOrMaker: Board.getDefault, subBuilder: Board.create)
    ..e<Event>(2, 'lastEvent', $pb.PbFieldType.OE, protoName: 'lastEvent', defaultOrMaker: Event.Stalemate, valueOf: Event.valueOf, enumValues: Event.values)
    ..aOS(3, 'gameId', protoName: 'gameId')
    ..e<Piece_Color>(4, 'turn', $pb.PbFieldType.OE, defaultOrMaker: Piece_Color.BLACK, valueOf: Piece_Color.valueOf, enumValues: Piece_Color.values)
    ..pc<Piece>(5, 'takenPieces', $pb.PbFieldType.PM, protoName: 'takenPieces', subBuilder: Piece.create)
    ..hasRequiredFields = false
  ;

  GameUpdateResponse._() : super();
  factory GameUpdateResponse() => create();
  factory GameUpdateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameUpdateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GameUpdateResponse clone() => GameUpdateResponse()..mergeFromMessage(this);
  GameUpdateResponse copyWith(void Function(GameUpdateResponse) updates) => super.copyWith((message) => updates(message as GameUpdateResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameUpdateResponse create() => GameUpdateResponse._();
  GameUpdateResponse createEmptyInstance() => create();
  static $pb.PbList<GameUpdateResponse> createRepeated() => $pb.PbList<GameUpdateResponse>();
  static GameUpdateResponse getDefault() => _defaultInstance ??= create()..freeze();
  static GameUpdateResponse _defaultInstance;

  Board get board => $_getN(0);
  set board(Board v) { setField(1, v); }
  $core.bool hasBoard() => $_has(0);
  void clearBoard() => clearField(1);

  Event get lastEvent => $_getN(1);
  set lastEvent(Event v) { setField(2, v); }
  $core.bool hasLastEvent() => $_has(1);
  void clearLastEvent() => clearField(2);

  $core.String get gameId => $_getS(2, '');
  set gameId($core.String v) { $_setString(2, v); }
  $core.bool hasGameId() => $_has(2);
  void clearGameId() => clearField(3);

  Piece_Color get turn => $_getN(3);
  set turn(Piece_Color v) { setField(4, v); }
  $core.bool hasTurn() => $_has(3);
  void clearTurn() => clearField(4);

  $core.List<Piece> get takenPieces => $_getList(4);
}

class MakeMoveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MakeMoveRequest', createEmptyInstance: create)
    ..a<Position>(1, 'from', $pb.PbFieldType.OM, defaultOrMaker: Position.getDefault, subBuilder: Position.create)
    ..a<Position>(2, 'to', $pb.PbFieldType.OM, defaultOrMaker: Position.getDefault, subBuilder: Position.create)
    ..a<Piece>(3, 'piece', $pb.PbFieldType.OM, defaultOrMaker: Piece.getDefault, subBuilder: Piece.create)
    ..aOS(4, 'gameId', protoName: 'gameId')
    ..hasRequiredFields = false
  ;

  MakeMoveRequest._() : super();
  factory MakeMoveRequest() => create();
  factory MakeMoveRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MakeMoveRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MakeMoveRequest clone() => MakeMoveRequest()..mergeFromMessage(this);
  MakeMoveRequest copyWith(void Function(MakeMoveRequest) updates) => super.copyWith((message) => updates(message as MakeMoveRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MakeMoveRequest create() => MakeMoveRequest._();
  MakeMoveRequest createEmptyInstance() => create();
  static $pb.PbList<MakeMoveRequest> createRepeated() => $pb.PbList<MakeMoveRequest>();
  static MakeMoveRequest getDefault() => _defaultInstance ??= create()..freeze();
  static MakeMoveRequest _defaultInstance;

  Position get from => $_getN(0);
  set from(Position v) { setField(1, v); }
  $core.bool hasFrom() => $_has(0);
  void clearFrom() => clearField(1);

  Position get to => $_getN(1);
  set to(Position v) { setField(2, v); }
  $core.bool hasTo() => $_has(1);
  void clearTo() => clearField(2);

  Piece get piece => $_getN(2);
  set piece(Piece v) { setField(3, v); }
  $core.bool hasPiece() => $_has(2);
  void clearPiece() => clearField(3);

  $core.String get gameId => $_getS(3, '');
  set gameId($core.String v) { $_setString(3, v); }
  $core.bool hasGameId() => $_has(3);
  void clearGameId() => clearField(4);
}

