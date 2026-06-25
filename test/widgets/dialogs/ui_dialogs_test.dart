import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('UICustomMessageDialog', () {
    testWidgets('responds to positive button click', (tester) async {
      var positiveClicked = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UICustomMessageDialog.simple(
              title: 'Simple Dialog',
              msg: 'Are you sure?',
              positiveBtn: 'Yes',
              onPositiveClick: () => positiveClicked = true,
              negativeBtn: 'No',
            ),
          ),
        ),
      );

      await tester.tap(find.text('Yes'));
      expect(positiveClicked, isTrue);
    });

    testWidgets('responds to negative button click', (tester) async {
      var negativeClicked = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UICustomMessageDialog.simple(
              title: 'Simple Dialog',
              msg: 'Are you sure?',
              positiveBtn: 'Yes',
              negativeBtn: 'No',
              onNegativeClick: () => negativeClicked = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('No'));
      expect(negativeClicked, isTrue);
    });

    testWidgets('renders dialog title and message', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UICustomMessageDialog.simple(
              title: 'Simple Dialog',
              msg: 'Are you sure?',
              positiveBtn: 'Yes',
              negativeBtn: 'No',
            ),
          ),
        ),
      );

      expect(find.text('Simple Dialog'), findsOneWidget);
      expect(find.text('Are you sure?'), findsOneWidget);
    });

    testWidgets('renders custom widget as message', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UICustomMessageDialog(
              title: 'Custom Content',
              msgWidget: Text('Custom Message Widget'),
              positiveBtn: 'OK',
            ),
          ),
        ),
      );

      expect(find.text('Custom Message Widget'), findsOneWidget);
    });
  });
}
