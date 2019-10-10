import 'package:flutter/material.dart';
import 'package:flutter_fintech/state/CurrencyState.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fintech/widgets/AccountOverview.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Displays the total balance and total debt',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        builder: (_) => CurrencyState(),
        child: MaterialApp(
          home: AccountOverview(
            totalDebt: 2800,
            totalBalance: 43000,
          ),
        ),
      ),
    );

    // Verify currency is displayed in a widget
    expect(find.text('\$'), findsOneWidget);

    // Verify total balance is displayed
    expect(find.text('43000'), findsOneWidget);

    // Verify total debt is displayed with currency
    expect(find.text('\$ 2800'), findsOneWidget);
  });

  testWidgets(
      'Displays placeholders for the total balance and total debt if data missing',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        builder: (_) => CurrencyState(),
        child: MaterialApp(
          home: AccountOverview(
            totalDebt: null,
            totalBalance: null,
          ),
        ),
      ),
    );

    // Verify placeholder for total balance is displayed
    expect(find.text('--'), findsOneWidget);

    // Verify placeholder for total debt is displayed with currency
    expect(find.text('\$ --'), findsOneWidget);
  });
}
