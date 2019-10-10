import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/CurrencyState.dart';
import '../utils.dart';
import '../models/bankAccountModel.dart';
import 'SectionHeader.dart';

class AccountList extends StatelessWidget {
  final List<BankAccountModel> accounts;

  AccountList({
    Key key,
    @required this.accounts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CurrencyState currency = Provider.of<CurrencyState>(context);

    return Column(
      children: <Widget>[
        SectionHeader(
          dialogText: 'Manage your accounts',
          headerText: 'Bank accounts',
          // for integration tests
          sectionKey: 'account_list',
        ),
        // Chose to make list non-scrollable as it is
        // at the bottom of the screen
        Column(
          children: accounts.map((account) {
            final String type = account.type;
            final int balance = account.balance;
            final String bankName = account.bankName;
            // the logo name is the bank name in lower case and without white spaces
            final String logo = bankName == null
                ? 'placeholder'
                : bankName.toLowerCase().replaceAll(' ', '');

            return Visibility(
              visible: (type != null || bankName != null),
              child: ListTile(
                leading: Image(
                  image: AssetImage('assets/$logo.png'),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${type == null ? 'Unknown' : type} account',
                      // for integration tests
                      key: Key('${type}_account_type'),
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      // displays a placeholder if the bank name data is missing
                      showDataOrPlaceholder(bankName),
                      // for integration tests
                      key: Key('${type}_account_bank_name'),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                trailing: Text(
                  // displays a placeholder if the balance data is missing
                  '${currency.symbol}${showDataOrPlaceholder(
                    currencyConverter(
                      balance,
                      currency.selected,
                    ),
                  )}',
                  // for integration tests
                  key: Key('${type}_account_balance'),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
