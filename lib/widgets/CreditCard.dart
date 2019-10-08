import 'package:flutter/material.dart';

import '../models/creditCardModel.dart';
import '../utils.dart';

class CreditCard extends StatelessWidget {
  CreditCard({
    Key key,
    this.colorGradient,
    @required this.currency,
    @required this.creditCard,
  }) : super(key: key);

  final String currency;
  final CreditCardModel creditCard;
  final Map<String, int> colorGradient;

  @override
  Widget build(BuildContext context) {
    return Card(
      // TODO: elevation
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: 255.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
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
                      showDataOrPlaceholder(creditCard.currentCredit),
                      style: TextStyle(
                        fontSize: 32.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  showDataOrPlaceholder(creditCard.type),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 28.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '****  ****  ****  ${creditCard.lastDigits == null ? '****' : creditCard.lastDigits}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    showDataOrPlaceholder(creditCard.expiryDate),
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
          ],
        ),
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
