import 'package:chess/model/piece.dart';
import 'package:flutter/material.dart';

import '../bloc/board_bloc.dart';

class PawnReplacementSelector extends StatelessWidget {
  final Pawn pawn;
  final BoardBloc bloc;

  const PawnReplacementSelector({
    Key key,
    @required this.pawn,
    @required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                onTap: () => _close(Rook, context)),
            ListTile(
                leading: Text('K'),
                title: Text('Knight'),
                onTap: () => _close(Knight, context)),
            ListTile(
                leading: Text('B'),
                title: Text('Bishop'),
                onTap: () => _close(Bishop, context)),
            ListTile(
                leading: Text('Q'),
                title: Text('Queen'),
                onTap: () => _close(Queen, context)),
          ],
        ),
      ),
    );
  }

  void _close(Type replacementType, context) {
    bloc.replacePawn(pawn, replacementType);
    Navigator.of(context).pop();
  }
}
