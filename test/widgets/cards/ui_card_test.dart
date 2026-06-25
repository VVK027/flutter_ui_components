import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('UICard', () {
    testWidgets('renders child content', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: UICard(child: Text('Card Content'))),
        ),
      );

      expect(find.text('Card Content'), findsOneWidget);
    });

    testWidgets('applies custom padding and color', (tester) async {
      const padding = EdgeInsets.all(20);
      const color = Colors.red;
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UICard(
              padding: padding,
              color: color,
              child: Text('Custom Card'),
            ),
          ),
        ),
      );

      final card = tester.widget<Card>(find.byType(Card));
      expect(card.color, color);

      // Look for the Padding widget specifically wrapping 'Custom Card'
      final paddingWidget = tester.widget<Padding>(
        find
            .ancestor(
              of: find.text('Custom Card'),
              matching: find.byType(Padding),
            )
            .first,
      );
      expect(paddingWidget.padding, padding);
    });
  });
}
