import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('UITextFormField', () {
    testWidgets('renders label and hint, and accepts input', (tester) async {
      String? changedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UITextFormField(
              label: 'User Name',
              hintText: 'Enter name',
              onChanged: (val) => changedValue = val,
            ),
          ),
        ),
      );

      expect(find.text('User Name'), findsOneWidget);
      expect(find.text('Enter name'), findsOneWidget);

      await tester.enterText(find.byType(TextFormField), 'Viivek');
      expect(changedValue, 'Viivek');
    });

    testWidgets('toggles password visibility', (tester) async {
      bool toggled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UITextFormField(
              label: 'Password',
              hintText: 'Enter password',
              isPassword: true,
              obscureText: true,
              onToggleObscure: () => toggled = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(IconButton));
      expect(toggled, isTrue);
    });
  });

  group('UILabeledField', () {
    testWidgets('renders label and child', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UILabeledField(
              label: 'Labeled Child',
              child: Text('Child Content'),
            ),
          ),
        ),
      );

      expect(find.text('Labeled Child'), findsOneWidget);
      expect(find.text('Child Content'), findsOneWidget);
    });
  });
}
