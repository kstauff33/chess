// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:chess/game_board.dart';
import 'package:chess/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ChessApp());

    // Verify that our counter starts at 0.
    expect(find.text('P'), findsNWidgets(16));
    expect(find.text('R'), findsNWidgets(4));
    expect(find.text('K'), findsNWidgets(4));
    expect(find.text('B'), findsNWidgets(4));
    expect(find.text('Q'), findsNWidgets(2));
    expect(find.text('G'), findsNWidgets(2));

    // Tap the '+' icon and trigger a frame.
//    await tester.tap(find.byElementType(Square).at());
//    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

