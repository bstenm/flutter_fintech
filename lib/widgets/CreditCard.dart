import 'package:flutter/material.dart';

import '../models/creditCardModel.dart';
import '../utils.dart';

class CreditCard extends StatelessWidget {
  CreditCard({
    Key key,
    this.itemKey,
    this.colorGradient,
    @required this.currency,
    @required this.creditCard,
  }) : super(key: key);

  final String itemKey;
  final String currency;
  final CreditCardModel creditCard;
  final Map<String, int> colorGradient;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: 255.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // shows the current credit along with the currency,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: Text(
                        currency,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      // a placeholder is shown if current credit is null
                      showDataOrPlaceholder(creditCard.currentCredit),
                      // for integration tests
                      key: Key('${itemKey}_credit'),
                      style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  // a placeholder is shown if current credit is missing
                  showDataOrPlaceholder(creditCard.type),
                  // for integration tests
                  key: Key('${itemKey}_type'),

                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 28.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            // some spacing
            SizedBox(height: 50.0),
            // displays the credit card number and the expiry date
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '****  ****  ****  ${creditCard.lastDigits == null ? '****' : creditCard.lastDigits}',
                    // for integration tests
                    key: Key('${itemKey}_number'),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    // a placeholder is shown if expiry date is missing
                    showDataOrPlaceholder(creditCard.expiryDate),
                    // for integration tests
                    key: Key('${itemKey}_expiry_date'),
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
          ],
        ),
        // gives the rounded corner of the card and its background color
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          gradient: colorGradient == null
              ? null
              : LinearGradient(
                  colors: [
                    Color(colorGradient['start']),
                    Color(colorGradient['end']),
                  ],
                  begin: FractionalOffset(1.5, 0.0),
                  end: FractionalOffset(0.0, 0.0),
                  stops: [0.0, 1.0],
                ),
        ),
      ),
    );
  }
}
