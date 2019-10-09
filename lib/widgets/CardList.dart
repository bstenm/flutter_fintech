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
  // the 2 gradients of color available for the cards background
  final List<Map<String, int>> colorGradients = [
    {'start': 0xFFA245E8, 'end': 0xFFF43587},
    {'start': 0xFFF43587, 'end': 0xFF5568FE},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionHeader(
          dialogText: 'Manage your cards',
          headerText: 'Credit cards',
        ),
        // needs to have a height set as we are
        // inside a widget with unbound height
        Container(
          height: 155.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: creditCards.length,
            itemBuilder: (BuildContext context, int index) {
              return CreditCard(
                currency: currency,
                creditCard: creditCards[index],
                // if index is even we use the first color gradient, else the second one
                colorGradient: colorGradients[index % 2 == 0 ? 0 : 1],
              );
            },
          ),
        ),
      ],
    );
  }
}
