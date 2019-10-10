import 'package:flutter/material.dart';
import 'package:flutter_fintech/state/CurrencyState.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fintech/widgets/CurrencyRadioButtons.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Displays radio buttons to switch between currencies',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        builder: (_) => CurrencyState(),
        child: MaterialApp(
          home: Material(
            child: CurrencyRadioButtons(),
          ),
        ),
      ),
    );

    // Verify all currencies are displayed
    expect(find.text('Dollar'), findsOneWidget);
    expect(find.text('Pound'), findsOneWidget);
    expect(find.text('Euro'), findsOneWidget);
  });
}
