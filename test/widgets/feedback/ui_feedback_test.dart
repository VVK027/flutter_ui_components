import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('UIEmptyState', () {
    testWidgets('renders icon and message', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UIEmptyState(
              icon: Icons.search_off,
              message: 'No results found',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search_off), findsOneWidget);
      expect(find.text('No results found'), findsOneWidget);
    });

    testWidgets('renders custom child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UIEmptyState(
              message: 'Nothing here',
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Retry'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Nothing here'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);
    });
  });
}
