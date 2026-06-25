import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('UIText', () {
    testWidgets('renders text with custom style', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UIText(
              'Styled Text',
              size: 24,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('Styled Text'));
      expect(textWidget.style?.fontSize, 24);
      expect(textWidget.style?.color, Colors.blue);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
    });
  });

  group('UIRichText', () {
    testWidgets('renders multiple spans', (tester) async {
      final spans = [
        const UIRichTextSpan(
          text: 'Normal ',
          style: TextStyle(color: Colors.black),
        ),
        const UIRichTextSpan(
          text: 'Bold',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: UIRichText(spans: spans)),
        ),
      );

      expect(find.byType(RichText), findsOneWidget);
      // Checking if text is present
      expect(find.textContaining('Normal'), findsOneWidget);
      expect(find.textContaining('Bold'), findsOneWidget);
    });

    testWidgets('handles span tap', (tester) async {
      bool tapped = false;
      final spans = [
        UIRichTextSpan(text: 'Tap Me', onTap: () => tapped = true),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: UIRichText(spans: spans)),
        ),
      );

      await tester.tap(find.textContaining('Tap Me'));
      expect(tapped, isTrue);
    });
  });
}
