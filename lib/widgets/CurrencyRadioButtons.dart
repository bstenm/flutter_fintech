import 'package:flutter/material.dart';
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
              value: 'dollar',
              groupValue: currency.selected,
              onChanged: (String value) {
                currency.selected = value;
                Navigator.of(context).pop();
              },
            ),
          ),
          ListTile(
            title: Text('Pound'),
            leading: Radio(
              value: 'pound',
              groupValue: currency.selected,
              onChanged: (String value) {
                currency.selected = value;
                Navigator.of(context).pop();
              },
            ),
          ),
          ListTile(
            title: Text('Euro'),
            leading: Radio(
              value: 'euro',
              groupValue: currency.selected,
              onChanged: (String value) {
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
