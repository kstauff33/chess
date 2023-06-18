///
//  Generated code. Do not modify.
//  source: chess.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'chess.pbenum.dart';

export 'chess.pbenum.dart';

class Board extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Board', createEmptyInstance: create)
    ..pc<Row>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rows', $pb.PbFieldType.PM, subBuilder: Row.create)
    ..hasRequiredFields = false
  ;

  Board._() : super();
  factory Board({
    $core.Iterable<Row>? rows,
  }) {
    final _result = create();
    if (rows != null) {
      _result.rows.addAll(rows);
    }
    return _result;
  }
  factory Board.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Board.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Board clone() => Board()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Board copyWith(void Function(Board) updates) => super.copyWith((message) => updates(message as Board)) as Board; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Board create() => Board._();
  Board createEmptyInstance() => create();
  static $pb.PbList<Board> createRepeated() => $pb.PbList<Board>();
  @$core.pragma('dart2js:noInline')
  static Board getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Board>(create);
  static Board? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Row> get rows => $_getList(0);
}

class Row extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Row', createEmptyInstance: create)
    ..pc<Square>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'squares', $pb.PbFieldType.PM, subBuilder: Square.create)
    ..hasRequiredFields = false
  ;

  Row._() : super();
  factory Row({
    $core.Iterable<Square>? squares,
  }) {
    final _result = create();
    if (squares != null) {
      _result.squares.addAll(squares);
    }
    return _result;
  }
  factory Row.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Row.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Row clone() => Row()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Row copyWith(void Function(Row) updates) => super.copyWith((message) => updates(message as Row)) as Row; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Row create() => Row._();
  Row createEmptyInstance() => create();
  static $pb.PbList<Row> createRepeated() => $pb.PbList<Row>();
  @$core.pragma('dart2js:noInline')
  static Row getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Row>(create);
  static Row? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Square> get squares => $_getList(0);
}

class Square extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Square', createEmptyInstance: create)
    ..aOM<Piece>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'piece', subBuilder: Piece.create)
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'empty')
    ..hasRequiredFields = false
  ;

  Square._() : super();
  factory Square({
    Piece? piece,
    $core.bool? empty,
  }) {
    final _result = create();
    if (piece != null) {
      _result.piece = piece;
    }
    if (empty != null) {
      _result.empty = empty;
    }
    return _result;
  }
  factory Square.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Square.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Square clone() => Square()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Square copyWith(void Function(Square) updates) => super.copyWith((message) => updates(message as Square)) as Square; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Square create() => Square._();
  Square createEmptyInstance() => create();
  static $pb.PbList<Square> createRepeated() => $pb.PbList<Square>();
  @$core.pragma('dart2js:noInline')
  static Square getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Square>(create);
  static Square? _defaultInstance;

  @$pb.TagNumber(1)
  Piece get piece => $_getN(0);
  @$pb.TagNumber(1)
  set piece(Piece v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPiece() => $_has(0);
  @$pb.TagNumber(1)
  void clearPiece() => clearField(1);
  @$pb.TagNumber(1)
  Piece ensurePiece() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get empty => $_getBF(1);
  @$pb.TagNumber(2)
  set empty($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmpty() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmpty() => clearField(2);
}

class Piece extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Piece', createEmptyInstance: create)
    ..e<Piece_Type>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: Piece_Type.KING, valueOf: Piece_Type.valueOf, enumValues: Piece_Type.values)
    ..e<Piece_Color>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'color', $pb.PbFieldType.OE, defaultOrMaker: Piece_Color.BLACK, valueOf: Piece_Color.valueOf, enumValues: Piece_Color.values)
    ..e<Piece_Direction>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'direction', $pb.PbFieldType.OE, defaultOrMaker: Piece_Direction.DOWN, valueOf: Piece_Direction.valueOf, enumValues: Piece_Direction.values)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  Piece._() : super();
  factory Piece({
    Piece_Type? type,
    Piece_Color? color,
    Piece_Direction? direction,
    $core.String? id,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (color != null) {
      _result.color = color;
    }
    if (direction != null) {
      _result.direction = direction;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory Piece.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Piece.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Piece clone() => Piece()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Piece copyWith(void Function(Piece) updates) => super.copyWith((message) => updates(message as Piece)) as Piece; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Piece create() => Piece._();
  Piece createEmptyInstance() => create();
  static $pb.PbList<Piece> createRepeated() => $pb.PbList<Piece>();
  @$core.pragma('dart2js:noInline')
  static Piece getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Piece>(create);
  static Piece? _defaultInstance;

  @$pb.TagNumber(1)
  Piece_Type get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(Piece_Type v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  Piece_Color get color => $_getN(1);
  @$pb.TagNumber(2)
  set color(Piece_Color v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasColor() => $_has(1);
  @$pb.TagNumber(2)
  void clearColor() => clearField(2);

  @$pb.TagNumber(3)
  Piece_Direction get direction => $_getN(2);
  @$pb.TagNumber(3)
  set direction(Piece_Direction v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDirection() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirection() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get id => $_getSZ(3);
  @$pb.TagNumber(4)
  set id($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);
}

class Position extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Position', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Position._() : super();
  factory Position({
    $core.int? x,
    $core.int? y,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    return _result;
  }
  factory Position.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Position.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Position clone() => Position()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Position copyWith(void Function(Position) updates) => super.copyWith((message) => updates(message as Position)) as Position; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Position create() => Position._();
  Position createEmptyInstance() => create();
  static $pb.PbList<Position> createRepeated() => $pb.PbList<Position>();
  @$core.pragma('dart2js:noInline')
  static Position getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Position>(create);
  static Position? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get x => $_getIZ(0);
  @$pb.TagNumber(1)
  set x($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get y => $_getIZ(1);
  @$pb.TagNumber(2)
  set y($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);
}

class JoinGameRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'JoinGameRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameId', protoName: 'gameId')
    ..hasRequiredFields = false
  ;

  JoinGameRequest._() : super();
  factory JoinGameRequest({
    $core.String? gameId,
  }) {
    final _result = create();
    if (gameId != null) {
      _result.gameId = gameId;
    }
    return _result;
  }
  factory JoinGameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinGameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinGameRequest clone() => JoinGameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinGameRequest copyWith(void Function(JoinGameRequest) updates) => super.copyWith((message) => updates(message as JoinGameRequest)) as JoinGameRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static JoinGameRequest create() => JoinGameRequest._();
  JoinGameRequest createEmptyInstance() => create();
  static $pb.PbList<JoinGameRequest> createRepeated() => $pb.PbList<JoinGameRequest>();
  @$core.pragma('dart2js:noInline')
  static JoinGameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinGameRequest>(create);
  static JoinGameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gameId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gameId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGameId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGameId() => clearField(1);
}

class GameUpdateResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameUpdateResponse', createEmptyInstance: create)
    ..aOM<Board>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'board', subBuilder: Board.create)
    ..e<Event>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastEvent', $pb.PbFieldType.OE, protoName: 'lastEvent', defaultOrMaker: Event.Stalemate, valueOf: Event.valueOf, enumValues: Event.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameId', protoName: 'gameId')
    ..e<Piece_Color>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'turn', $pb.PbFieldType.OE, defaultOrMaker: Piece_Color.BLACK, valueOf: Piece_Color.valueOf, enumValues: Piece_Color.values)
    ..pc<Piece>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'takenPieces', $pb.PbFieldType.PM, protoName: 'takenPieces', subBuilder: Piece.create)
    ..hasRequiredFields = false
  ;

  GameUpdateResponse._() : super();
  factory GameUpdateResponse({
    Board? board,
    Event? lastEvent,
    $core.String? gameId,
    Piece_Color? turn,
    $core.Iterable<Piece>? takenPieces,
  }) {
    final _result = create();
    if (board != null) {
      _result.board = board;
    }
    if (lastEvent != null) {
      _result.lastEvent = lastEvent;
    }
    if (gameId != null) {
      _result.gameId = gameId;
    }
    if (turn != null) {
      _result.turn = turn;
    }
    if (takenPieces != null) {
      _result.takenPieces.addAll(takenPieces);
    }
    return _result;
  }
  factory GameUpdateResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameUpdateResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameUpdateResponse clone() => GameUpdateResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameUpdateResponse copyWith(void Function(GameUpdateResponse) updates) => super.copyWith((message) => updates(message as GameUpdateResponse)) as GameUpdateResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameUpdateResponse create() => GameUpdateResponse._();
  GameUpdateResponse createEmptyInstance() => create();
  static $pb.PbList<GameUpdateResponse> createRepeated() => $pb.PbList<GameUpdateResponse>();
  @$core.pragma('dart2js:noInline')
  static GameUpdateResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameUpdateResponse>(create);
  static GameUpdateResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Board get board => $_getN(0);
  @$pb.TagNumber(1)
  set board(Board v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoard() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoard() => clearField(1);
  @$pb.TagNumber(1)
  Board ensureBoard() => $_ensure(0);

  @$pb.TagNumber(2)
  Event get lastEvent => $_getN(1);
  @$pb.TagNumber(2)
  set lastEvent(Event v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastEvent() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastEvent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get gameId => $_getSZ(2);
  @$pb.TagNumber(3)
  set gameId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGameId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGameId() => clearField(3);

  @$pb.TagNumber(4)
  Piece_Color get turn => $_getN(3);
  @$pb.TagNumber(4)
  set turn(Piece_Color v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTurn() => $_has(3);
  @$pb.TagNumber(4)
  void clearTurn() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<Piece> get takenPieces => $_getList(4);
}

class MakeMoveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MakeMoveRequest', createEmptyInstance: create)
    ..aOM<Position>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'from', subBuilder: Position.create)
    ..aOM<Position>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'to', subBuilder: Position.create)
    ..aOM<Piece>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'piece', subBuilder: Piece.create)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gameId', protoName: 'gameId')
    ..hasRequiredFields = false
  ;

  MakeMoveRequest._() : super();
  factory MakeMoveRequest({
    Position? from,
    Position? to,
    Piece? piece,
    $core.String? gameId,
  }) {
    final _result = create();
    if (from != null) {
      _result.from = from;
    }
    if (to != null) {
      _result.to = to;
    }
    if (piece != null) {
      _result.piece = piece;
    }
    if (gameId != null) {
      _result.gameId = gameId;
    }
    return _result;
  }
  factory MakeMoveRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MakeMoveRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MakeMoveRequest clone() => MakeMoveRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MakeMoveRequest copyWith(void Function(MakeMoveRequest) updates) => super.copyWith((message) => updates(message as MakeMoveRequest)) as MakeMoveRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MakeMoveRequest create() => MakeMoveRequest._();
  MakeMoveRequest createEmptyInstance() => create();
  static $pb.PbList<MakeMoveRequest> createRepeated() => $pb.PbList<MakeMoveRequest>();
  @$core.pragma('dart2js:noInline')
  static MakeMoveRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MakeMoveRequest>(create);
  static MakeMoveRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Position get from => $_getN(0);
  @$pb.TagNumber(1)
  set from(Position v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFrom() => $_has(0);
  @$pb.TagNumber(1)
  void clearFrom() => clearField(1);
  @$pb.TagNumber(1)
  Position ensureFrom() => $_ensure(0);

  @$pb.TagNumber(2)
  Position get to => $_getN(1);
  @$pb.TagNumber(2)
  set to(Position v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);
  @$pb.TagNumber(2)
  Position ensureTo() => $_ensure(1);

  @$pb.TagNumber(3)
  Piece get piece => $_getN(2);
  @$pb.TagNumber(3)
  set piece(Piece v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPiece() => $_has(2);
  @$pb.TagNumber(3)
  void clearPiece() => clearField(3);
  @$pb.TagNumber(3)
  Piece ensurePiece() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get gameId => $_getSZ(3);
  @$pb.TagNumber(4)
  set gameId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGameId() => $_has(3);
  @$pb.TagNumber(4)
  void clearGameId() => clearField(4);
}

