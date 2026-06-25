import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_components_example/app.dart';

void main() {
  testWidgets('Showcase home loads catalog', (tester) async {
    await tester.pumpWidget(const FlutterUiComponentsExampleApp());
    await tester.pumpAndSettle();

    expect(find.text('Flutter UI Components'), findsWidgets);
    expect(find.text('Buttons'), findsOneWidget);
    expect(find.text('Core utilities'), findsOneWidget);
  });
}
