import 'package:chess/bloc/board_bloc.dart';
import 'package:chess/model/events.dart';
import 'package:flutter/material.dart';

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
