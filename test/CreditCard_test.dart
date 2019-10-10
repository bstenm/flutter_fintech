import 'package:flutter/material.dart';
import 'package:flutter_fintech/models/creditCardModel.dart';
import 'package:flutter_fintech/state/CurrencyState.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fintech/widgets/CreditCard.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Displays the card balance, type, last digits, and expiry date',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        builder: (_) => CurrencyState(),
        child: MaterialApp(
          home: CreditCard(
            creditCard: CreditCardModel.fromJson({
              'type': 'visa',
              'lastDigits': '8364',
              'expiryDate': '08/26',
              'currentCredit': 98,
            }),
          ),
        ),
      ),
    );

    // Verify currency is displayed in a widget
    expect(find.text('\$'), findsOneWidget);

    // Verify current credit is displayed
    expect(find.text('98'), findsOneWidget);

    // Verify card last digits are displayed
    expect(find.text('****  ****  ****  8364'), findsOneWidget);

    // Verify card expiry date is displayed
    expect(find.text('08/26'), findsOneWidget);

// Verify no placeholders are displayed
    expect(find.text('--'), findsNothing);
  });

  testWidgets('Displays placeholders for missing data',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        builder: (_) => CurrencyState(),
        child: MaterialApp(
          home: CreditCard(
            creditCard: CreditCardModel.fromJson({
              'type': null,
              'lastDigits': null,
              'expiryDate': null,
              'currentCredit': null,
            }),
          ),
        ),
      ),
    );

    // Verify placeholders are displayed for current
    // credit, card type and expiry date are displayed
    expect(find.text('--'), findsNWidgets(3));

    // Verify placeholder is displayed for last digits
    expect(find.text('****  ****  ****  ****'), findsOneWidget);
  });
}
