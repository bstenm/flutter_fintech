import 'package:flutter/material.dart';

import '../utils.dart';

class AccountOverview extends StatelessWidget {
  AccountOverview({
    Key key,
    @required this.currency,
    @required this.totalBalance,
    @required this.totalDebt,
  }) : super(key: key);

  final String currency;
  final int totalBalance;
  final int totalDebt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // the total balance
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Text(
                  'Total balance',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    currency,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                  Text(
                    // displays a placeholder if total balance data missing
                    showDataOrPlaceholder(totalBalance),
                    // for integration tests
                    key: Key('total_balance'),
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  ),
                ],
              )
            ],
          ),
          // the total debt
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Total debt',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                // displays a placeholder if total debt data missing
                '$currency ${showDataOrPlaceholder(totalDebt)}',
                // for integration tests
                key: Key('total_debt'),
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
