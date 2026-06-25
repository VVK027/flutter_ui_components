import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('UITabBar', () {
    testWidgets('renders items and handles click', (tester) async {
      int clickedIndex = -1;
      final items = ['Tab 1', 'Tab 2', 'Tab 3'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UITabBar<String>(
              items: items,
              getTextFromItem: (item) => item,
              onTabClicked: (index, item) => clickedIndex = index,
              selectedTextStyle: const TextStyle(color: Colors.blue),
              unSelectedTextStyle: const TextStyle(color: Colors.grey),
            ),
          ),
        ),
      );

      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('Tab 2'), findsOneWidget);
      expect(find.text('Tab 3'), findsOneWidget);

      await tester.tap(find.text('Tab 2'));
      expect(clickedIndex, 1);
    });
  });

  group('UISegmentedTabBar', () {
    testWidgets('renders tabs and handles press', (tester) async {
      int pressedIndex = -1;
      final tabs = [
        const UISegmentTabItem(label: 'Day', value: 'day', isActive: true),
        const UISegmentTabItem(label: 'Week', value: 'week', isActive: false),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UISegmentedTabBar(
              isWide: true,
              onTabPressed: (index) => pressedIndex = index,
              tabs: tabs,
            ),
          ),
        ),
      );

      expect(find.text('Day'), findsOneWidget);
      expect(find.text('Week'), findsOneWidget);

      await tester.tap(find.text('Week'));
      expect(pressedIndex, 1);
    });
  });
}
