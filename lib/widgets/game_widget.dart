import 'package:chess/model/events.dart';
import 'package:chess/model/utils.dart';
import 'package:chess/widgets/event_stream.dart';
import 'package:chess/widgets/pawn_replacement_selector.dart';
import 'package:chess/widgets/widget_utils.dart';
import 'package:flutter/material.dart';

import '../bloc/board_bloc.dart';
import 'game_board.dart';

class GameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build gamewidget');
    var bloc = BoardProvider.of(context)!;

    bloc.registerPawnReplacement((event) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return PawnReplacementSelector(
            bloc: bloc,
            pawn: event.piece,
          );
        },
      );
    });
    // bloc.events.whereType<PawnReachedEnd>().listen((event) {
    //   showModalBottomSheet(
    //     context: context,
    //     builder: (context) {
    //       return PawnReplacementSelector(
    //         bloc: bloc,
    //         pawn: event.piece,
    //       );
    //     },
    //   );
    // });

    var deviceSize = MediaQuery.of(context).size;
    var width = deviceSize.width;
    var height = deviceSize.height - 150;

    return StreamBuilder<GameEvent>(
      stream: bloc.events,
      builder: (context, snapshot) {
        final moveTitle = Padding(
          padding: EdgeInsets.all(16.0),
          child: titleText(getTitle(bloc, snapshot.data)),
        );

        if (height > width) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              moveTitle,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[BoardWidget()],
              ),
              EventStream(),
            ],
          );
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  moveTitle,
                  BoardWidget(),
                ],
              ),
            ),
            EventStream(),
          ],
        );
      },
    );
  }

  String getTitle(BoardBloc bloc, GameEvent? event) {
    if (event is Checkmate) {
      return 'Game Over!';
    }
    if (event is Stalemate) {
      return 'Stalemate! Game Over!';
    }
    return "${colorAsString(bloc.game.turn)}'s Turn";
  }
}
