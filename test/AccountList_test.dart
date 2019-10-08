import 'package:flutter/material.dart';
import 'package:flutter_fintech/models/bankAccountModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fintech/widgets/AccountList.dart';

void main() {
  testWidgets('Displays the account types, balances, and bank names',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: AccountList(
            currency: '£',
            accounts: [
              BankAccountModel.fromJson({
                'type': 'Checking',
                'balance': 234.9,
                'bankName': 'Bank of America',
              }),
              BankAccountModel.fromJson({
                'type': 'Savings',
                'balance': 8.9,
                'bankName': 'Bank of America',
              })
            ],
          ),
        ),
      ),
    );

    // Verify both accounts are displayed
    expect(find.byType(ListTile), findsNWidgets(2));
    
    // Verify both images are displayed
    expect(find.byType(Image), findsNWidgets(2));

    // Verify account types are displayed
    expect(find.text('Checking account'), findsOneWidget);
    expect(find.text('Savings account'), findsOneWidget);

    // Verify bank names are displayed
    expect(find.text('Bank of America'), findsNWidgets(2));

    // Verify account balances are displayed with currency
    expect(find.text('£234.9'), findsOneWidget);
    expect(find.text('£8.9'), findsOneWidget);

    // Verify no placeholder are displayed
    expect(find.text('--'), findsNothing);
    expect(find.text('£--'), findsNothing);
    expect(find.text('Unknown account'), findsNothing);
  });

  testWidgets('Displays placeholders if data missing',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: AccountList(
            currency: '£',
            accounts: [
              BankAccountModel.fromJson({
                'type': null,
                'balance': null,
                'bankName': 'Bank of America',
              }),
              BankAccountModel.fromJson({
                'type': 'Savings',
                'balance': 8.9,
                'bankName': null,
              })
            ],
          ),
        ),
      ),
    );

    // Verify both accounts are displayed
    expect(find.byType(ListTile), findsNWidgets(2));

    // Verify placeholder for 1st account type is displayed
    expect(find.text('Unknown account'), findsOneWidget);

    // Verify placeholder for 2nd account bank name is displayed
    expect(find.text('--'), findsOneWidget);

    // Verify placeholder for 1st account balance is displayed with currency
    expect(find.text('£--'), findsOneWidget);
  });

  testWidgets(
      'Does not display the account if both account type and bank name are missing',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: AccountList(
            currency: '£',
            accounts: [
              BankAccountModel.fromJson({
                'type': null,
                'balance': 938.53,
                'bankName': null,
              }),
            ],
          ),
        ),
      ),
    );

    // Verify both accounts are displayed
    expect(find.byType(ListTile), findsNothing);
  });
}
