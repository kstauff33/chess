import 'package:chess/bloc/preference_bloc.dart';
import 'package:chess/model/events.dart';
import 'package:chess/widgets/setting_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/board_bloc.dart';
import 'model/game.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((preferences) {
    runApp(ChessApp(preferences: preferences));
  });
}

class ChessApp extends StatelessWidget {
  final SharedPreferences? preferences;

  const ChessApp({Key? key, this.preferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferencesProvider(
      sp: preferences,
      child: MaterialApp(
        title: 'Chess',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
        ),
        home: HomeWidget(),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  // final Game game;
  final BoardBloc bloc;

  HomeWidget({Key? key})
      : bloc = BoardBloc(game: LocalGame()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoardProvider(
      boardBloc: bloc,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text('Chess'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            UndoButton(),
            NewGameButton(),
            SettingsButton(),
          ],
        ),
        body: GameWidget(),
      ),
    );
  }
}

class NewGameButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BoardProvider.of(context);
    return IconButton(
      icon: Icon(Icons.refresh),
      onPressed: () {
        bloc!.newGame(LocalGame());
      },
    );
  }
}

class UndoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BoardProvider.of(context)!;
    return StreamBuilder(
      stream: bloc.events,
      builder: (context, snapshot) {
        var moves = bloc.game.events.where((event) => event is Move).toList();
        if (moves.length > 0) {
          return IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => bloc.game.undo(),
          );
        }
        return Container();
      },
    );
  }
}
