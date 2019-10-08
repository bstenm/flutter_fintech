import 'package:flutter/material.dart';

import '../utils.dart';
import '../models/bankAccountModel.dart';
import 'SectionHeader.dart';

class AccountList extends StatelessWidget {
  final String currency;
  final List<BankAccountModel> accounts;

  AccountList({
    Key key,
    @required this.accounts,
    @required this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionHeader(
          dialogText: 'Manage your accounts',
          headerText: 'Bank accounts',
        ),
        // Non-scrollable list as the space the list takes in the
        // viewport is too small to make scrolling convenient
        Column(
          children: accounts.map((account) {
            final String type = account.type;
            final double balance = account.balance;
            final String bankName = account.bankName;
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
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      showDataOrPlaceholder(bankName),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                trailing: Text(
                  '$currency${showDataOrPlaceholder(balance)}',
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
