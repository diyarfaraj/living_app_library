// test/src/components/button_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:living_app_library/src/components/button.dart';

void main() {
  testWidgets('LivingAppButton displays text', (WidgetTester tester) async {
    const testText = 'Click Me';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LivingAppButton(
            text: testText,
            isLoading: false,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text(testText), findsOneWidget);
  });

  testWidgets('LivingAppButton shows CircularProgressIndicator when loading', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LivingAppButton(
            text: 'Loading...',
            isLoading: true,
            onPressed: () {},
          ),
        ),
      ),
    );

    // The CircularProgressIndicator should be found
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('LivingAppButton onPressed is called on tap', (WidgetTester tester) async {
    var pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LivingAppButton(
            text: 'Tap Me',
            isLoading: false,
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Tap Me'));
    await tester.pump();

    expect(pressed, isTrue);
  });
} 