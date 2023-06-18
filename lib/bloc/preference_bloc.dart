import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider extends InheritedWidget {
  final Preferences preferences;

  PreferencesProvider({SharedPreferences? sp, required Widget child})
      : preferences = Preferences(sp),
        super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Preferences of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<PreferencesProvider>()!.preferences;
}

class Preferences {
  final SharedPreferences? preferences;

  Preferences(this.preferences);

  static const _SHOW_MOVES = 'show-moves';

  bool get showMoves => preferences!.getBool(_SHOW_MOVES) ?? true;

  set showMoves(bool showMoves) => preferences!.setBool(_SHOW_MOVES, showMoves);
}
