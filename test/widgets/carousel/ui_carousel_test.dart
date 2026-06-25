import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('UICarouselWithIndicator', () {
    testWidgets('renders items and updates indicator on page change', (
      tester,
    ) async {
      int changedPage = -1;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UICarouselWithIndicator(
              itemCount: 3,
              height: 200,
              builder: (context, index, realIndex) => Text('Page $index'),
              selectedIndicatorColor: Colors.blue,
              unSelectedIndicatorColor: Colors.grey,
              onPageChange: (index) => changedPage = index,
            ),
          ),
        ),
      );

      expect(find.text('Page 0'), findsOneWidget);

      // Swipe to next page
      await tester.drag(find.byType(PageView), const Offset(-400, 0));
      await tester.pumpAndSettle();

      expect(find.text('Page 1'), findsOneWidget);
      expect(changedPage, 1);
    });
  });
}
