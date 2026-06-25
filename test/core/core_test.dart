import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('DoubleExtension', () {
    test('roundToDecimal rounds correctly', () {
      expect(1.23456789.roundToDecimal(places: 2), 1.23);
      expect(1.235.roundToDecimal(places: 2), 1.24);
      expect(1.0.roundToDecimal(places: 5), 1.0);
    });
  });

  group('StringExtension', () {
    test('equalsIgnoreCase works', () {
      expect('Hello'.equalsIgnoreCase('hello '), isTrue);
      expect('Test'.equalsIgnoreCase('abc'), isFalse);
    });

    test('capitalizeFirstLetter works', () {
      expect('hello'.capitalizeFirstLetter(), 'Hello');
      expect('WORLD'.capitalizeFirstLetter(), 'World');
    });

    test('capitalizeAllFirstLetters works', () {
      expect('hello world'.capitalizeAllFirstLetters(), 'Hello World');
    });

    test('toDouble works', () {
      expect('123.45'.toDouble(), 123.45);
      expect('invalid'.toDouble(), 0.0);
    });
  });

  group('UIAppTheme', () {
    test('light theme has correct primary color', () {
      final theme = UIAppTheme.light;
      expect(theme.brightness, Brightness.light);
      expect(theme.colorScheme.primary, const Color(0xFF0D9488));
    });

    test('dark theme has correct primary color', () {
      final theme = UIAppTheme.dark;
      expect(theme.brightness, Brightness.dark);
      expect(theme.colorScheme.primary, const Color(0xFF14B8A6));
    });
  });
}
