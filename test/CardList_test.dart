import 'package:flutter/material.dart';
import 'package:flutter_fintech/models/creditCardModel.dart';
import 'package:flutter_fintech/state/CurrencyState.dart';
import 'package:flutter_fintech/widgets/CreditCard.dart';
import 'package:flutter_fintech/widgets/SectionHeader.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fintech/widgets/CardList.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Displays a list of cards', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        builder: (_) => CurrencyState(),
        child: MaterialApp(
          home: CardList(
            creditCards: [
              CreditCardModel.fromJson({
                'type': 'visa',
                'lastDigits': '1234',
                'expiryDate': '06/22',
                'currentCredit': 943,
              }),
              CreditCardModel.fromJson({
                'type': 'visa',
                'lastDigits': '5678',
                'expiryDate': '08/26',
                'currentCredit': 98,
              }),
            ],
          ),
        ),
      ),
    );

    // Verify a section header is displayed
    expect(find.byType(SectionHeader), findsOneWidget);

    // Verify 2 credit cards are displayed
    expect(find.byType(CreditCard), findsNWidgets(2));
  });
}
