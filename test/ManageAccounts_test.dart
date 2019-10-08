import 'package:flutter/material.dart';
import 'package:flutter_fintech/widgets/AccountList.dart';
import 'package:flutter_fintech/widgets/AccountOverview.dart';
import 'package:flutter_fintech/widgets/CardList.dart';
import 'package:flutter_fintech/widgets/SpendingChart.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fintech/widgets/ManageAccounts.dart';

void main() {
  testWidgets('Displays all the necessary widgets for that screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ManageAccounts(
          chartData: [],
          totalDebt: 234,
          totalBalance: 23432,
          creditCards: [],
          accounts: [],
        ),
      ),
    );

    // Verify the account overview is displayed
    expect(find.byType(AccountOverview), findsOneWidget);

    // Verify the spending chart is displayed
    expect(find.byType(SpendingChart), findsOneWidget);

    // Verify the card list is displayed
    expect(find.byType(CardList), findsOneWidget);

    // Verify the account list is displayed
    expect(find.byType(AccountList), findsOneWidget);
  });
}
