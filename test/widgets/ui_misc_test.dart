import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('UIListTileSelect', () {
    testWidgets('renders title and selection', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UIListTileSelect(
              title: 'Language',
              titleSelection: 'English',
              titleColor: Colors.black,
              subtitleColor: Colors.grey,
              selectedTitleColor: Colors.blue,
              unselectedTitleColor: Colors.black,
              arrowColor: Colors.grey,
              showArrow: true,
            ),
          ),
        ),
      );

      expect(find.text('Language'), findsOneWidget);
      expect(find.text('English'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_forward_ios_rounded), findsOneWidget);
    });
  });

  group('UIErrorInfo', () {
    testWidgets('renders title and description, and handles button press', (
      tester,
    ) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UIErrorInfo(
              title: 'Error',
              description: 'Something went wrong',
              btnText: 'Retry',
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      expect(find.text('Error'), findsOneWidget);
      expect(find.text('Something went wrong'), findsOneWidget);
      await tester.tap(find.text('Retry'));
      expect(pressed, isTrue);
    });
  });

  group('UIImage', () {
    testWidgets('renders broken image icon for empty source', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: UIImage(''))),
      );

      expect(find.byIcon(Icons.broken_image_outlined), findsOneWidget);
    });
  });
}
