import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('UIStatSummaryCard', () {
    testWidgets('renders multiple stat items', (tester) async {
      final items = [
        const UIStatSummaryItem(label: 'Label 1', value: 'Val 1'),
        const UIStatSummaryItem(label: 'Label 2', value: 'Val 2'),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: UIStatSummaryCard(items: items)),
        ),
      );

      expect(find.text('Label 1'), findsOneWidget);
      expect(find.text('Val 1'), findsOneWidget);
      expect(find.text('Label 2'), findsOneWidget);
      expect(find.text('Val 2'), findsOneWidget);
    });
  });

  group('UIStatusBanner', () {
    testWidgets('renders title, subtitle and leading widget', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UIStatusBanner(
              title: 'Status Title',
              subtitle: 'Status Subtitle',
              leading: Icon(Icons.info),
            ),
          ),
        ),
      );

      expect(find.text('Status Title'), findsOneWidget);
      expect(find.text('Status Subtitle'), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
    });
  });

  group('UIIconBadge', () {
    testWidgets('renders with correct color and size', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UIIconBadge(
              icon: Icon(Icons.star),
              accentColor: Colors.amber,
              size: 60,
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.amber.withValues(alpha: 0.12));
      expect(container.constraints?.maxWidth, 60);
    });
  });

  group('UISectionHeader', () {
    testWidgets('renders title and icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UISectionHeader(title: 'Section Title', icon: Icons.settings),
          ),
        ),
      );

      expect(find.text('Section Title'), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);
    });
  });

  group('UICurrentReadingRow', () {
    testWidgets('renders icon and value', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UICurrentReadingRow(
              icon: Icon(Icons.speed),
              value: '120 km/h',
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.speed), findsOneWidget);
      expect(find.text('120 km/h'), findsOneWidget);
    });
  });

  group('UISummaryGrid', () {
    testWidgets('renders all items', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: UISummaryGrid(
              items: [
                UISummaryGridItem(
                  icon: Icon(Icons.directions_walk),
                  label: 'Steps',
                  value: Text('8,000'),
                ),
                UISummaryGridItem(
                  icon: Icon(Icons.local_fire_department),
                  label: 'Calories',
                  value: Text('320 kCal'),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Steps'), findsOneWidget);
      expect(find.text('8,000'), findsOneWidget);
      expect(find.text('Calories'), findsOneWidget);
      expect(find.text('320 kCal'), findsOneWidget);
    });
  });
}
