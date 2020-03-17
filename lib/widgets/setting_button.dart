import 'package:chess/bloc/preference_bloc.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.settings),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => SettingSheet(),
        );
      },
    );
  }
}

class SettingSheet extends StatefulWidget {
  @override
  _SettingSheetState createState() => _SettingSheetState();
}

class _SettingSheetState extends State<SettingSheet> {
  @override
  Widget build(BuildContext context) {
    var preferences = PreferencesProvider.of(context);
    return ListView(
      children: <Widget>[
        Container(
          color: Theme.of(context).primaryColor,
          child: Text(
            'Settings',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          padding: EdgeInsets.all(16),
        ),
        SwitchListTile(
          title: Text('Show available moves?'),
          value: preferences.showMoves,
          onChanged: (value) {
            setState(() {
              preferences.showMoves = value;
            });
          },
        )
      ],
    );
  }
}
