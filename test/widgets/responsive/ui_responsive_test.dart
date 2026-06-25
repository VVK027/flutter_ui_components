import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('ResponsiveLayout', () {
    testWidgets('shows mobile widget on small screens', (tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: ResponsiveLayout(
            mobile: Text('Mobile'),
            tablet: Text('Tablet'),
            desktop: Text('Desktop'),
          ),
        ),
      );

      expect(find.text('Mobile'), findsOneWidget);
      expect(find.text('Tablet'), findsNothing);
      expect(find.text('Desktop'), findsNothing);

      addTearDown(tester.view.resetPhysicalSize);
    });

    testWidgets('shows desktop widget on large screens', (tester) async {
      tester.view.physicalSize = const Size(1200, 800);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MaterialApp(
          home: ResponsiveLayout(
            mobile: Text('Mobile'),
            tablet: Text('Tablet'),
            desktop: Text('Desktop'),
          ),
        ),
      );

      expect(find.text('Desktop'), findsOneWidget);
      expect(find.text('Mobile'), findsNothing);

      addTearDown(tester.view.resetPhysicalSize);
    });
  });
}
