import 'dart:math';

import 'package:chess/piece.dart';
import 'package:flutter/material.dart';

import 'board.dart';
import 'board_bloc.dart';

/*
TODOs: 
  1) En passant
  2) Undo is broken
  3) Polish stream output
  4) settings (show moves?)
  5) disable selection
  6) Confirm restart
  7) Store game history (stas/past games)
  8) forward
  9) stalemate
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
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
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => bloc.undo(),
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PawnReplacementSelector extends StatelessWidget {
  final PersistentBottomSheetController controller;
  final Pawn pawn;

  const PawnReplacementSelector({Key key, this.controller, this.pawn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BoardProvider.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Choose your piece',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            ListTile(
                leading: Text('R'),
                title: Text('Rook'),
                onTap: () => _close(Rook, bloc)),
            ListTile(
                leading: Text('K'),
                title: Text('Knight'),
                onTap: () => _close(Knight, bloc)),
            ListTile(
                leading: Text('B'),
                title: Text('Bishop'),
                onTap: () => _close(Bishop, bloc)),
            ListTile(
                leading: Text('Q'),
                title: Text('Queen'),
                onTap: () => _close(Queen, bloc)),
          ],
        ),
      ),
    );
  }

  void _close(Type replacementType, BoardBloc bloc) {
    bloc.replacePawn(pawn, replacementType);
    controller.close();
  }
}

class GameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BoardProvider.of(context);

    bloc.gameEvent.where((event) => event is PawnReachedEnd).listen((event) {
      var controller;
      controller = showBottomSheet(
        context: context,
        builder: (context) {
          return PawnReplacementSelector(
            pawn: (event as PawnReachedEnd).piece,
            controller: controller,
          );
        },
      );
    });

    return StreamBuilder(
      stream: bloc.gameEvent,
      builder: (context, snapshot) {
        bool gameOver = snapshot.data is Checkmate;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: pieceText(
                  gameOver
                      ? 'GAME OVER!'
                      : "${colorAsString(bloc.turn)}'s Turn",
                  color: Colors.grey.shade700),
            ),
            BoardWidget(),
            EventStream(),
          ],
        );
      },
    );
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
//    var primaryColor = Theme.of(context).primaryColor;
//    return Row(
//      children: BoardProvider.of(context)
//          .takenPieces
//          .where((piece) => piece.color == pieceColor)
//          .map((piece) => Container(
//                decoration: BoxDecoration(
//                    color: pieceColor == PieceColor.WHITE
//                        ? primaryColor
//                        : Colors.white,
//                    borderRadius: BorderRadius.circular(8.0),
//                    border: Border.all(color: primaryColor)),
//
////              decoration: ShapeDecoration(
////                shape: StadiumBorder(), color: Colors.black,
//////                  border:
//////                      RoundedRectangleBorder(),
//////                  Border.all(color: Colors.blue)),
////              ),
//                child: Padding(
//                  padding:
//                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//                  child: pieceText(piece.getLetter(),
//                      color: pieceColor == PieceColor.WHITE
//                          ? Colors.white
//                          : Colors.black),
//                ),
//              ))
//          .toList(),
//    );
  }
}

Widget pieceText(String text, {Color color = Colors.black}) {
  return Text(text, style: TextStyle(fontSize: 32, color: color));
}

class BoardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BoardProvider.of(context);
    var availableMoves = bloc.board.availableMoves(bloc.selectedPiece);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(BOARD_WIDTH, (int y) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(BOARD_HEIGHT, (int x) {
            var piece = bloc.board.getAtPosition(x: x, y: y);
            var position = Position(x: x, y: y);
            return Square(
              piece: piece,
              isSelected: bloc.selectedPiece == piece && piece != null,
              isAvailable: availableMoves.contains(position),
              position: position,
            );
          }),
        );
      }),
    );
  }
}

class Square extends StatelessWidget {
  final Piece piece;
  final Position position;
  final isSelected;
  final isAvailable;

  const Square({
    Key key,
    this.piece,
    this.position,
    this.isSelected = false,
    this.isAvailable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var boardBloc = BoardProvider.of(context);
    var color;
    if (isSelected) {
      color = Colors.blue;
    } else if (isAvailable) {
      color = Colors.green;
    } else {
      color = position.x % 2 == position.y % 2
          ? Colors.brown.shade200
          : Colors.brown.shade300;
    }

    return GestureDetector(
      onTap: () => boardBloc.selectSquare(position),
      child: Container(
        height: boardBloc.squareSize,
        width: boardBloc.squareSize,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black),
        ),
        child: Center(child: getPieceRepresentation()),
      ),
    );
  }

  Widget getPieceRepresentation() {
    if (piece == null) return Container();
    switch (piece.type) {
      case PieceType.PAWN:
        break;
      case PieceType.ROOK:
        break;
      case PieceType.KNIGHT:
        break;
      case PieceType.BISHOP:
        break;
      case PieceType.QUEEN:
        break;
      case PieceType.KING:
        break;
    }
    return Text(
      piece.getLetter(),
      style: TextStyle(
        fontSize: 32,
        color: piece.color == PieceColor.BLACK ? Colors.black : Colors.white,
      ),
    );
  }
}
