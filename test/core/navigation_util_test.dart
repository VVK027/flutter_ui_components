import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('NavigationUtil', () {
    testWidgets('pushPage navigates to new page', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: ElevatedButton(
                onPressed: () => NavigationUtil.pushPage(
                  context,
                  const Scaffold(body: Text('New Page')),
                ),
                child: const Text('Go'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();

      expect(find.text('New Page'), findsOneWidget);
    });

    testWidgets('pop returns to previous page', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: ElevatedButton(
                onPressed: () => NavigationUtil.pushPage(
                  context,
                  Scaffold(
                    body: Builder(
                      builder: (ctx) => ElevatedButton(
                        onPressed: () => NavigationUtil.pop(ctx),
                        child: const Text('Back'),
                      ),
                    ),
                  ),
                ),
                child: const Text('Go'),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Go'));
      await tester.pumpAndSettle();
      expect(find.text('Back'), findsOneWidget);

      await tester.tap(find.text('Back'));
      await tester.pumpAndSettle();
      expect(find.text('Go'), findsOneWidget);
    });
  });
}
