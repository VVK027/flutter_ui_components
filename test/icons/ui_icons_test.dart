import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/src/icons/ui_svg_path_parser.dart';

void main() {
  group('SvgPathParser', () {
    test('parses simple MoveTo and LineTo', () {
      const pathData = 'M 0 0 L 10 10 Z';
      final path = parseSvgPathData(pathData);
      expect(path, isA<Path>());
    });

    test('parses cubic curves', () {
      const pathData = 'M 10 10 C 20 20, 40 20, 50 10';
      final path = parseSvgPathData(pathData);
      expect(path, isA<Path>());
    });

    test('parses horizontal and vertical lines', () {
      const pathData = 'M 0 0 H 10 V 10';
      final path = parseSvgPathData(pathData);
      expect(path, isA<Path>());
    });

    test('throws on unsupported command', () {
      const pathData =
          'M 0 0 Q 5 5 10 0'; // Q is not supported in the minimal parser
      expect(
        () => parseSvgPathData(pathData),
        throwsA(isA<UnsupportedError>()),
      );
    });
  });
}
