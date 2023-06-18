import 'dart:math';

import 'package:chess/bloc/board_bloc.dart';
import 'package:chess/bloc/preference_bloc.dart';
import 'package:chess/model/events.dart';
import 'package:chess/model/piece.dart';
import 'package:flutter/material.dart';

import '../model/board.dart';

class BoardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BoardProvider.of(context)!;
    final availableMoves = bloc.game.board.availableMoves(bloc.selectedPiece);
    final size = MediaQuery.of(context).size;
    final maxWidth = min(size.height * .8, size.width * .9);

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: GridView(
        padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        children: List.generate(64, (index) {
          var x = index % 8;
          var y = (index / 8).floor();
          var piece = bloc.game.board.getAtPosition(x: x, y: y);
          var position = Position(x: x, y: y);
          return Square(
            piece: piece,
            isSelected: bloc.selectedPiece == piece && piece != null,
            isAvailable: availableMoves.contains(position),
            position: position,
          );
        }),
      ),
    );
  }
}

class Square extends StatelessWidget {
  final Piece? piece;
  final Position? position;
  final isSelected;
  final isAvailable;

  const Square({
    Key? key,
    this.piece,
    this.position,
    this.isSelected = false,
    this.isAvailable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var preferences = PreferencesProvider.of(context);
    var boardBloc = BoardProvider.of(context)!;
    var color;
    if (isSelected) {
      color = Colors.blue;
    } else if (isAvailable && preferences.showMoves) {
      color = Colors.green;
    } else {
      color = position!.x% 2 == position!.y% 2
          ? Colors.brown.shade200
          : Colors.brown.shade300;
    }

    var event = boardBloc.game.events.lastOrNull;

    return GestureDetector(
      onTap: () {
        if (event is Checkmate || event is Stalemate) return;
        boardBloc.selectSquare(position!);
      },
      child: Container(
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
    switch (piece!.type) {
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
    return Icon(
      piece!.getIcon(),
      color: piece!.color == PieceColor.BLACK ? Colors.black : Colors.white,
    );
  }
}
