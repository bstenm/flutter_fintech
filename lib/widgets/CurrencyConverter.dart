import 'package:flutter/material.dart';
import 'package:flutter_fintech/utils.dart';
import 'package:provider/provider.dart';

import '../state/CurrencyState.dart';

class CurrencyConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CurrencyState currency = Provider.of<CurrencyState>(context);

    return Container(
      height: 180.0,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Dollar',
              // for integration tests
              key: Key('dollar_option_text'),
            ),
            leading: Radio(
              // for integration tests
              key: Key('dollar_option_button'),
              value: Currency.dollar,
              groupValue: currency.selected,
              onChanged: (Currency value) {
                currency.selected = value;
                Navigator.of(context).pop();
              },
            ),
          ),
          ListTile(
            title: Text(
              'Pound',
              // for integration tests
              key: Key('pound_option_text'),
            ),
            leading: Radio(
              // for integration tests
              key: Key('pound_option_button'),
              value: Currency.pound,
              groupValue: currency.selected,
              onChanged: (Currency value) {
                currency.selected = value;
                Navigator.of(context).pop();
              },
            ),
          ),
          ListTile(
            title: Text(
              'Euro', // for integration tests
              key: Key('euro_option_text'),
            ),
            leading: Radio(
              value: Currency.euro,
              groupValue: currency.selected,
              onChanged: (Currency value) {
                currency.selected = value;
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
