///
//  Generated code. Do not modify.
//  source: chess.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use eventDescriptor instead')
const Event$json = const {
  '1': 'Event',
  '2': const [
    const {'1': 'Stalemate', '2': 0},
    const {'1': 'Move', '2': 1},
    const {'1': 'PieceTaken', '2': 2},
    const {'1': 'PawnReachedEnd', '2': 3},
    const {'1': 'Undo', '2': 4},
    const {'1': 'ReplacementSelected', '2': 5},
    const {'1': 'Check', '2': 6},
    const {'1': 'Checkmate', '2': 7},
    const {'1': 'NewGame', '2': 8},
    const {'1': 'PlayerJoined', '2': 9},
    const {'1': 'AwaitingPlayer', '2': 10},
  ],
};

/// Descriptor for `Event`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List eventDescriptor = $convert.base64Decode('CgVFdmVudBINCglTdGFsZW1hdGUQABIICgRNb3ZlEAESDgoKUGllY2VUYWtlbhACEhIKDlBhd25SZWFjaGVkRW5kEAMSCAoEVW5kbxAEEhcKE1JlcGxhY2VtZW50U2VsZWN0ZWQQBRIJCgVDaGVjaxAGEg0KCUNoZWNrbWF0ZRAHEgsKB05ld0dhbWUQCBIQCgxQbGF5ZXJKb2luZWQQCRISCg5Bd2FpdGluZ1BsYXllchAK');
@$core.Deprecated('Use boardDescriptor instead')
const Board$json = const {
  '1': 'Board',
  '2': const [
    const {'1': 'rows', '3': 1, '4': 3, '5': 11, '6': '.Row', '10': 'rows'},
  ],
};

/// Descriptor for `Board`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boardDescriptor = $convert.base64Decode('CgVCb2FyZBIYCgRyb3dzGAEgAygLMgQuUm93UgRyb3dz');
@$core.Deprecated('Use rowDescriptor instead')
const Row$json = const {
  '1': 'Row',
  '2': const [
    const {'1': 'squares', '3': 1, '4': 3, '5': 11, '6': '.Square', '10': 'squares'},
  ],
};

/// Descriptor for `Row`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rowDescriptor = $convert.base64Decode('CgNSb3cSIQoHc3F1YXJlcxgBIAMoCzIHLlNxdWFyZVIHc3F1YXJlcw==');
@$core.Deprecated('Use squareDescriptor instead')
const Square$json = const {
  '1': 'Square',
  '2': const [
    const {'1': 'piece', '3': 1, '4': 1, '5': 11, '6': '.Piece', '10': 'piece'},
    const {'1': 'empty', '3': 2, '4': 1, '5': 8, '10': 'empty'},
  ],
};

/// Descriptor for `Square`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List squareDescriptor = $convert.base64Decode('CgZTcXVhcmUSHAoFcGllY2UYASABKAsyBi5QaWVjZVIFcGllY2USFAoFZW1wdHkYAiABKAhSBWVtcHR5');
@$core.Deprecated('Use pieceDescriptor instead')
const Piece$json = const {
  '1': 'Piece',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.Piece.Type', '10': 'type'},
    const {'1': 'color', '3': 2, '4': 1, '5': 14, '6': '.Piece.Color', '10': 'color'},
    const {'1': 'direction', '3': 3, '4': 1, '5': 14, '6': '.Piece.Direction', '10': 'direction'},
    const {'1': 'id', '3': 4, '4': 1, '5': 9, '10': 'id'},
  ],
  '4': const [Piece_Type$json, Piece_Color$json, Piece_Direction$json],
};

@$core.Deprecated('Use pieceDescriptor instead')
const Piece_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'KING', '2': 0},
    const {'1': 'PAWN', '2': 1},
    const {'1': 'ROOK', '2': 2},
    const {'1': 'KNIGHT', '2': 3},
    const {'1': 'BISHOP', '2': 4},
    const {'1': 'QUEEN', '2': 5},
  ],
};

@$core.Deprecated('Use pieceDescriptor instead')
const Piece_Color$json = const {
  '1': 'Color',
  '2': const [
    const {'1': 'BLACK', '2': 0},
    const {'1': 'WHITE', '2': 1},
  ],
};

@$core.Deprecated('Use pieceDescriptor instead')
const Piece_Direction$json = const {
  '1': 'Direction',
  '2': const [
    const {'1': 'DOWN', '2': 0},
    const {'1': 'UP', '2': 1},
  ],
};

/// Descriptor for `Piece`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pieceDescriptor = $convert.base64Decode('CgVQaWVjZRIfCgR0eXBlGAEgASgOMgsuUGllY2UuVHlwZVIEdHlwZRIiCgVjb2xvchgCIAEoDjIMLlBpZWNlLkNvbG9yUgVjb2xvchIuCglkaXJlY3Rpb24YAyABKA4yEC5QaWVjZS5EaXJlY3Rpb25SCWRpcmVjdGlvbhIOCgJpZBgEIAEoCVICaWQiRwoEVHlwZRIICgRLSU5HEAASCAoEUEFXThABEggKBFJPT0sQAhIKCgZLTklHSFQQAxIKCgZCSVNIT1AQBBIJCgVRVUVFThAFIh0KBUNvbG9yEgkKBUJMQUNLEAASCQoFV0hJVEUQASIdCglEaXJlY3Rpb24SCAoERE9XThAAEgYKAlVQEAE=');
@$core.Deprecated('Use positionDescriptor instead')
const Position$json = const {
  '1': 'Position',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 5, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 5, '10': 'y'},
  ],
};

/// Descriptor for `Position`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List positionDescriptor = $convert.base64Decode('CghQb3NpdGlvbhIMCgF4GAEgASgFUgF4EgwKAXkYAiABKAVSAXk=');
@$core.Deprecated('Use joinGameRequestDescriptor instead')
const JoinGameRequest$json = const {
  '1': 'JoinGameRequest',
  '2': const [
    const {'1': 'gameId', '3': 1, '4': 1, '5': 9, '10': 'gameId'},
  ],
};

/// Descriptor for `JoinGameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinGameRequestDescriptor = $convert.base64Decode('Cg9Kb2luR2FtZVJlcXVlc3QSFgoGZ2FtZUlkGAEgASgJUgZnYW1lSWQ=');
@$core.Deprecated('Use gameUpdateResponseDescriptor instead')
const GameUpdateResponse$json = const {
  '1': 'GameUpdateResponse',
  '2': const [
    const {'1': 'board', '3': 1, '4': 1, '5': 11, '6': '.Board', '10': 'board'},
    const {'1': 'lastEvent', '3': 2, '4': 1, '5': 14, '6': '.Event', '10': 'lastEvent'},
    const {'1': 'gameId', '3': 3, '4': 1, '5': 9, '10': 'gameId'},
    const {'1': 'turn', '3': 4, '4': 1, '5': 14, '6': '.Piece.Color', '10': 'turn'},
    const {'1': 'takenPieces', '3': 5, '4': 3, '5': 11, '6': '.Piece', '10': 'takenPieces'},
  ],
};

/// Descriptor for `GameUpdateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameUpdateResponseDescriptor = $convert.base64Decode('ChJHYW1lVXBkYXRlUmVzcG9uc2USHAoFYm9hcmQYASABKAsyBi5Cb2FyZFIFYm9hcmQSJAoJbGFzdEV2ZW50GAIgASgOMgYuRXZlbnRSCWxhc3RFdmVudBIWCgZnYW1lSWQYAyABKAlSBmdhbWVJZBIgCgR0dXJuGAQgASgOMgwuUGllY2UuQ29sb3JSBHR1cm4SKAoLdGFrZW5QaWVjZXMYBSADKAsyBi5QaWVjZVILdGFrZW5QaWVjZXM=');
@$core.Deprecated('Use makeMoveRequestDescriptor instead')
const MakeMoveRequest$json = const {
  '1': 'MakeMoveRequest',
  '2': const [
    const {'1': 'gameId', '3': 4, '4': 1, '5': 9, '10': 'gameId'},
    const {'1': 'from', '3': 1, '4': 1, '5': 11, '6': '.Position', '10': 'from'},
    const {'1': 'to', '3': 2, '4': 1, '5': 11, '6': '.Position', '10': 'to'},
    const {'1': 'piece', '3': 3, '4': 1, '5': 11, '6': '.Piece', '10': 'piece'},
  ],
};

/// Descriptor for `MakeMoveRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List makeMoveRequestDescriptor = $convert.base64Decode('Cg9NYWtlTW92ZVJlcXVlc3QSFgoGZ2FtZUlkGAQgASgJUgZnYW1lSWQSHQoEZnJvbRgBIAEoCzIJLlBvc2l0aW9uUgRmcm9tEhkKAnRvGAIgASgLMgkuUG9zaXRpb25SAnRvEhwKBXBpZWNlGAMgASgLMgYuUGllY2VSBXBpZWNl');
