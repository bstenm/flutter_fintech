import 'package:flutter/material.dart';

import '../models/creditCardModel.dart';
import 'CreditCard.dart';
import 'SectionHeader.dart';

class CardList extends StatelessWidget {
  CardList({
    Key key,
    @required this.creditCards,
    @required this.currency,
  }) : super(key: key);

  final List<CreditCardModel> creditCards;
  final String currency;
  final List<Map<String, int>> colorGradients = [
    {'start': 0xFFA245E8, 'end': 0xFFF43587},
    {'start': 0xFFF43587, 'end': 0xFF5568FE},
    {'start': 0xFF7C5FE7, 'end': 0xFFF43587},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionHeader(
          dialogText: 'Manage your cards',
          headerText: 'Credit cards',
        ),
        Container(
          height: 155.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: creditCards.length,
            itemBuilder: (BuildContext context, int index) {
              return CreditCard(
                currency: currency,
                creditCard: creditCards[index],
                colorGradient: colorGradients[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
