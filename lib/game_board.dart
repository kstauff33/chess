import 'package:chess/board_bloc.dart';
import 'package:chess/piece.dart';
import 'package:flutter/material.dart';

import 'board.dart';

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

    var event = boardBloc.gameEvent.value;

    return GestureDetector(
      onTap: () {
        if (event is Checkmate || event is Stalemate) return;
        boardBloc.selectSquare(position);
      },
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
