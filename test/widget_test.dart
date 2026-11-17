import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/main.dart';
import 'package:tictactoe/pages/game_page.dart';

void main() {
  testWidgets(
    'local win stays visible, locks board and preserves score on replay',
    (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text('X, your move'), findsOneWidget);
      for (final i in [0, 3, 1, 4, 2]) {
        await tester.ensureVisible(find.byKey(ValueKey('cell-$i')));
        await tester.tap(find.byKey(ValueKey('cell-$i')));
        await tester.pumpAndSettle();
      }
      expect(find.text('X wins!'), findsOneWidget);
      expect(
        find.bySemanticsLabel('Row 1, column 1: X, winning cell'),
        findsOneWidget,
      );
      await tester.ensureVisible(find.text('Play again'));
      await tester.tap(find.text('Play again'));
      await tester.pumpAndSettle();
      expect(find.text('X, your move'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
      await tester.ensureVisible(find.text('Reset scores'));
      await tester.tap(find.text('Reset scores'));
      await tester.pumpAndSettle();
      expect(find.text('1'), findsNothing);
    },
  );
  testWidgets(
    'number keys play, occupied keys reject, computer replies and mode resets scores',
    (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.sendKeyEvent(LogicalKeyboardKey.digit1);
      await tester.pumpAndSettle();
      expect(find.text('O, your move'), findsOneWidget);
      await tester.sendKeyEvent(LogicalKeyboardKey.digit1);
      await tester.pumpAndSettle();
      expect(find.text('O, your move'), findsOneWidget);
      await tester.ensureVisible(find.text('Computer'));
      await tester.tap(find.text('Computer'));
      await tester.pumpAndSettle();
      expect(find.text('X, your move'), findsOneWidget);
      await tester.ensureVisible(find.byKey(const ValueKey('cell-0')));
      await tester.tap(find.byKey(const ValueKey('cell-0')));
      await tester.pumpAndSettle();
      expect(find.text('O'), findsWidgets);
      expect(find.text('X, your move'), findsOneWidget);
    },
  );
  testWidgets(
    'small screen and large text remain scrollable without overflow',
    (tester) async {
      tester.view.physicalSize = const Size(320, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        const MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(textScaler: TextScaler.linear(2)),
            child: GamePage(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      await tester.ensureVisible(find.text('Reset scores'));
      expect(find.text('Reset scores'), findsOneWidget);
    },
  );
}
