import 'dart:math';

import 'package:chess/model/events.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/board.dart';
import 'bloc/board_bloc.dart';
import 'widgets/game_widget.dart';

/*
TODOs: 
  * En passant
  * Castling
  * Polish stream output
  * settings (show moves?)
  * Confirm restart
  * Store game history (stas/past games)
  * redo
 */

void main() {
  SharedPreferences.getInstance().then((preferences) {
    runApp(ChessApp(preferences: preferences));
  });
}

class ChessApp extends StatelessWidget {
  final SharedPreferences preferences;

  const ChessApp({Key key, this.preferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(preferences: preferences),
    );
  }
}

class HomeWidget extends StatefulWidget {
  final SharedPreferences preferences;

  const HomeWidget({Key key, this.preferences}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  BoardBloc bloc;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    var width = deviceSize.width;
    var height = deviceSize.height;
    var squareSize = min(width / BOARD_WIDTH, height / BOARD_HEIGHT);

    bloc = BoardBloc(squareSize: squareSize);
    return BoardProvider(
      boardBloc: bloc,
      child: Scaffold(
        body: GameWidget(),
        appBar: AppBar(
          title: Text('Chess'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            StreamBuilder(
              stream: bloc.gameEvent,
              builder: (context, snapshot) {
                var moves =
                    bloc.events.where((event) => event is Move).toList();
                if (moves != null && moves.length > 0) {
                  return IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => bloc.undo(),
                  );
                }
                return Container();
              },
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  // rebuild widget => new game
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView(
                      children: <Widget>[
                        SwitchListTile(
                            value: widget.preferences.getBool('Show moves'),
                            onChanged: (value) {
                              widget.preferences.setBool('Show moves', value);
                            })
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
