// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:geobull_innovation/main.dart';

void main() {
  testWidgets('MyApp loads LoginScreen initially', (WidgetTester tester) async {
    // Provide the required constructor arguments
    await tester.pumpWidget(
      const MyApp(isLoggedIn: false, name: '', gmail: ''),
    );

    // Verify Login Page text is shown
    expect(find.text('Login Page'), findsOneWidget);
  });
}
