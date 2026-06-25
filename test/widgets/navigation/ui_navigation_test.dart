import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('UIAppBar', () {
    testWidgets('renders title and responds to back press', (tester) async {
      bool backPressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: UIAppBar(
              title: 'AppBar Title',
              showBackButton: true,
              onBackPressed: () => backPressed = true,
            ),
            body: Container(),
          ),
        ),
      );

      expect(find.text('AppBar Title'), findsOneWidget);
      await tester.tap(find.byIcon(Icons.arrow_back_ios_new));
      expect(backPressed, isTrue);
    });

    testWidgets('accent variant renders correctly', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            appBar: UIAppBar.accent(
              title: 'Accent Title',
              accentColor: Colors.blue,
            ),
            body: SizedBox.shrink(),
          ),
        ),
      );

      expect(find.text('Accent Title'), findsOneWidget);
      final appBar = tester.widget<AppBar>(find.byType(AppBar));
      expect(appBar.backgroundColor, Colors.blue);
    });
  });
}
