import 'package:flutter/material.dart';
import 'package:flutter_fintech/utils.dart';
import 'package:provider/provider.dart';

import '../state/CurrencyState.dart';

class CurrencyRadioButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CurrencyState currency = Provider.of<CurrencyState>(context);

    return Container(
      height: 180.0,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Dollar'),
            leading: Radio(
              value: Currency.dollar,
              groupValue: currency.selected,
              onChanged: (Currency value) {
                currency.selected = value;
                Navigator.of(context).pop();
              },
            ),
          ),
          ListTile(
            title: Text('Pound'),
            leading: Radio(
              value: Currency.pound,
              groupValue: currency.selected,
              onChanged: (Currency value) {
                currency.selected = value;
                Navigator.of(context).pop();
              },
            ),
          ),
          ListTile(
            title: Text('Euro'),
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
