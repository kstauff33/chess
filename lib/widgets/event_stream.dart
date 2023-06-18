import 'package:chess/bloc/board_bloc.dart';
import 'package:chess/model/events.dart';
import 'package:chess/widgets/widget_utils.dart';
import 'package:flutter/material.dart';

class EventStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BoardProvider.of(context)!;
    var events = bloc.game.events.reversed
        .where((event) => event is! SquareSelected)
        .toList();
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          shrinkWrap: false,
          itemCount: events.length + 1,
          itemBuilder: (context, ndx) {
            if (ndx == 0) {
              return Center(child: titleText('Moves'));
            }
            var event = events[ndx - 1];
            return ListTile(
              leading: Icon(Icons.arrow_upward),
              title: Text(event.getDescription()),
              trailing: Text('#$ndx'),
            );
          },
        ),
      ),
    );
  }
}
