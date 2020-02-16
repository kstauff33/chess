import 'package:chess/pawn_replacement_selector.dart';
import 'package:chess/utils.dart';
import 'package:flutter/material.dart';

import 'board_bloc.dart';
import 'game_board.dart';

class GameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BoardProvider.of(context);

    bloc.gameEvent.where((event) => event is PawnReachedEnd).listen((event) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return PawnReplacementSelector(
            bloc: bloc,
            pawn: (event as PawnReachedEnd).piece,
          );
        },
      );
    });

    return StreamBuilder(
      stream: bloc.gameEvent,
      builder: (context, snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: pieceText(getTitle(bloc, snapshot.data),
                  color: Colors.grey.shade700),
            ),
            BoardWidget(),
            EventStream(),
          ],
        );
      },
    );
  }

  String getTitle(BoardBloc bloc, GameEvent event) {
    if (event is Checkmate) {
      return 'Game Over!';
    }
    if (event is Stalemate) {
      return 'Stalemate! Game Over!';
    }
    return "${colorAsString(bloc.turn)}'s Turn";
  }
}

class EventStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BoardProvider.of(context);
    var events = bloc.events.reversed
        .where((event) => event is! SquareSelected)
        .toList();
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: events.length,
        itemBuilder: (context, ndx) {
          var event = events[ndx];
          return ListTile(
            title: Text(event.getDescription()),
          );
        },
      ),
    );
  }
}
