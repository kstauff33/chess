///
//  Generated code. Do not modify.
//  source: chess.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chess.pb.dart' as $0;
export 'chess.pb.dart';

class GameClient extends $grpc.Client {
  static final _$gameState =
      $grpc.ClientMethod<$0.JoinGameRequest, $0.GameUpdateResponse>(
          '/Game/GameState',
          ($0.JoinGameRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GameUpdateResponse.fromBuffer(value));
  static final _$makeMove =
      $grpc.ClientMethod<$0.MakeMoveRequest, $0.GameUpdateResponse>(
          '/Game/MakeMove',
          ($0.MakeMoveRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GameUpdateResponse.fromBuffer(value));

  GameClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<$0.GameUpdateResponse> gameState(
      $0.JoinGameRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$gameState, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.GameUpdateResponse> makeMove(
      $0.MakeMoveRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$makeMove, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class GameServiceBase extends $grpc.Service {
  $core.String get $name => 'Game';

  GameServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.JoinGameRequest, $0.GameUpdateResponse>(
        'GameState',
        gameState_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.JoinGameRequest.fromBuffer(value),
        ($0.GameUpdateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MakeMoveRequest, $0.GameUpdateResponse>(
        'MakeMove',
        makeMove_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MakeMoveRequest.fromBuffer(value),
        ($0.GameUpdateResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.GameUpdateResponse> gameState_Pre($grpc.ServiceCall call,
      $async.Future<$0.JoinGameRequest> request) async* {
    yield* gameState(call, await request);
  }

  $async.Future<$0.GameUpdateResponse> makeMove_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MakeMoveRequest> request) async {
    return makeMove(call, await request);
  }

  $async.Stream<$0.GameUpdateResponse> gameState(
      $grpc.ServiceCall call, $0.JoinGameRequest request);
  $async.Future<$0.GameUpdateResponse> makeMove(
      $grpc.ServiceCall call, $0.MakeMoveRequest request);
}
