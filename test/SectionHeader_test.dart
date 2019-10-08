import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fintech/widgets/SectionHeader.dart';

void main() {
  testWidgets(
      'Display the header and manage button for a section of the screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SectionHeader(
          headerText: 'Header text',
          dialogText: 'Dialog Text',
        ),
      ),
    );

    // Verify the header text is displayed
    expect(find.text('Header text'), findsOneWidget);

    // Verify the link to manage list
    expect(find.text('Manage'), findsOneWidget);

    // Tap the link to manage list
    await tester.tap(find.text('Manage'));
    await tester.pump();

    // Verify the dialog box is displayed
    expect(find.text('Dialog Text'), findsOneWidget);
  });
}
