import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  group('UILoadingOverlay', () {
    testWidgets('shows overlay when visible is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: UILoadingOverlay(
            visible: true,
            message: 'Loading Message',
            child: Container(),
          ),
        ),
      );

      expect(find.text('Loading Message'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('hides overlay when visible is false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: UILoadingOverlay(
            visible: false,
            message: 'Loading Message',
            child: Container(),
          ),
        ),
      );

      expect(find.text('Loading Message'), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });

  group('UILoadingIndicator', () {
    testWidgets('renders correctly with given parameters', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UILoadingIndicator(size: 50, strokeWidth: 5, color: Colors.red),
        ),
      );

      final indicator = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(indicator.strokeWidth, 5);
      expect(
        indicator.valueColor,
        isA<AlwaysStoppedAnimation<Color>>().having(
          (a) => a.value,
          'color',
          Colors.red,
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find
            .ancestor(
              of: find.byType(CircularProgressIndicator),
              matching: find.byType(SizedBox),
            )
            .first,
      );
      expect(sizedBox.width, 50);
      expect(sizedBox.height, 50);
    });
  });

  group('UIShimmerLoadingContainer', () {
    testWidgets('shows loading view when isLoading is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UIShimmerLoadingContainer(
            type: UIShimmerLoadingType.list,
            isLoading: true,
            child: Text('Content'),
          ),
        ),
      );

      expect(find.byType(UIListViewShimmerLoading), findsOneWidget);
      expect(find.text('Content'), findsNothing);
    });

    testWidgets('shows child when isLoading is false', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: UIShimmerLoadingContainer(
            type: UIShimmerLoadingType.list,
            isLoading: false,
            child: Text('Content'),
          ),
        ),
      );

      expect(find.text('Content'), findsOneWidget);
      expect(find.byType(UIListViewShimmerLoading), findsNothing);
    });
  });
}
