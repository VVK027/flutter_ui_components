import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('UIDivider', () {
    testWidgets('renders with correct color', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: UIDivider(color: Colors.red)),
        ),
      );

      final divider = tester.widget<Divider>(find.byType(Divider));
      expect(divider.color, Colors.red);
    });
  });

  group('UIFixedSectionListView', () {
    testWidgets('renders all sections', (tester) async {
      final sections = [
        const Text('Section 1'),
        const Text('Section 2'),
        const Text('Section 3'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: UIFixedSectionListView(sections: sections)),
        ),
      );

      expect(find.text('Section 1'), findsOneWidget);
      expect(find.text('Section 2'), findsOneWidget);
      expect(find.text('Section 3'), findsOneWidget);
    });
  });

  group('UIScrollableScreen', () {
    testWidgets('renders child content', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UIScrollableScreen(child: Text('Scrollable Content')),
          ),
        ),
      );

      expect(find.text('Scrollable Content'), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('renders slivers in custom mode', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UIScrollableScreen(
              type: UIScrollableType.custom,
              slivers: [SliverToBoxAdapter(child: Text('Sliver Content'))],
            ),
          ),
        ),
      );

      expect(find.text('Sliver Content'), findsOneWidget);
      expect(find.byType(CustomScrollView), findsOneWidget);
    });
  });
}
