///
//  Generated code. Do not modify.
//  source: chess.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

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

const Board$json = const {
  '1': 'Board',
  '2': const [
    const {'1': 'rows', '3': 1, '4': 3, '5': 11, '6': '.Row', '10': 'rows'},
  ],
};

const Row$json = const {
  '1': 'Row',
  '2': const [
    const {'1': 'squares', '3': 1, '4': 3, '5': 11, '6': '.Square', '10': 'squares'},
  ],
};

const Square$json = const {
  '1': 'Square',
  '2': const [
    const {'1': 'piece', '3': 1, '4': 1, '5': 11, '6': '.Piece', '10': 'piece'},
    const {'1': 'empty', '3': 2, '4': 1, '5': 8, '10': 'empty'},
  ],
};

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

const Piece_Color$json = const {
  '1': 'Color',
  '2': const [
    const {'1': 'BLACK', '2': 0},
    const {'1': 'WHITE', '2': 1},
  ],
};

const Piece_Direction$json = const {
  '1': 'Direction',
  '2': const [
    const {'1': 'DOWN', '2': 0},
    const {'1': 'UP', '2': 1},
  ],
};

const Position$json = const {
  '1': 'Position',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 5, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 5, '10': 'y'},
  ],
};

const JoinGameRequest$json = const {
  '1': 'JoinGameRequest',
  '2': const [
    const {'1': 'gameId', '3': 1, '4': 1, '5': 9, '10': 'gameId'},
  ],
};

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

const MakeMoveRequest$json = const {
  '1': 'MakeMoveRequest',
  '2': const [
    const {'1': 'gameId', '3': 4, '4': 1, '5': 9, '10': 'gameId'},
    const {'1': 'from', '3': 1, '4': 1, '5': 11, '6': '.Position', '10': 'from'},
    const {'1': 'to', '3': 2, '4': 1, '5': 11, '6': '.Position', '10': 'to'},
    const {'1': 'piece', '3': 3, '4': 1, '5': 11, '6': '.Piece', '10': 'piece'},
  ],
};

