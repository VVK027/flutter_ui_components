import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  const buttonStyle = UIStyledButtonStyle(
    height: 48,
    borderRadius: 8,
    textStyle: TextStyle(fontSize: 16),
    textColor: Colors.white,
    loadingIndicatorSize: 20,
    loadingIndicatorColor: Colors.white,
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    disabledBackgroundColor: Colors.grey,
    disabledForegroundColor: Colors.black,
    outlineBorderColor: Colors.blue,
  );

  group('UIStyledButton', () {
    testWidgets('renders child and responds to tap', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UIStyledButton(
              style: buttonStyle,
              onPressed: () => pressed = true,
              child: const Text('Click Me'),
            ),
          ),
        ),
      );

      expect(find.text('Click Me'), findsOneWidget);
      await tester.tap(find.byType(UIStyledButton));
      expect(pressed, isTrue);
    });

    testWidgets('shows loading indicator when isLoading is true', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UIStyledButton(
              style: buttonStyle,
              isLoading: true,
              child: Text('Click Me'),
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('is disabled when isDisabled is true', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UIStyledButton(
              style: buttonStyle,
              isDisabled: true,
              onPressed: () => pressed = true,
              child: const Text('Click Me'),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(UIStyledButton));
      expect(pressed, isFalse);
    });
  });

  group('UIIconButton', () {
    testWidgets('renders icon and responds to tap', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UIIconButton(Icons.add, onPressed: () => pressed = true),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      await tester.tap(find.byIcon(Icons.add));
      expect(pressed, isTrue);
    });
  });

  group('UIImageButton', () {
    testWidgets('renders image and responds to tap', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UIImageButton(
              image: const Icon(
                Icons.image,
              ), // Using Icon as a placeholder for image widget
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      expect(find.byType(Icon), findsOneWidget);
      await tester.tap(find.byType(Icon));
      expect(pressed, isTrue);
    });
  });

  group('UITextButton', () {
    testWidgets('renders text and responds to tap', (tester) async {
      bool pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UITextButton(
              text: 'Button Text',
              onPressed: () => pressed = true,
            ),
          ),
        ),
      );

      expect(find.text('Button Text'), findsOneWidget);
      await tester.tap(find.text('Button Text'));
      expect(pressed, isTrue);
    });
  });
}
