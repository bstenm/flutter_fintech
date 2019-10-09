import 'package:flutter/material.dart';

import '../models/bankAccountModel.dart';
import '../models/creditCardModel.dart';
import '../models/spendingDataModel.dart';
import '../widgets/SpendingChart.dart';
import '../widgets/AccountList.dart';
import '../widgets/CardList.dart';
import '../widgets/AccountOverview.dart';

class ManageAccounts extends StatefulWidget {
  final int totalDebt;
  final int totalBalance;
  final List<CreditCardModel> creditCards;
  final List<BankAccountModel> accounts;
  final List<SpendingDataModel> chartData;

  ManageAccounts({
    Key key,
    @required this.chartData,
    @required this.totalDebt,
    @required this.totalBalance,
    @required this.creditCards,
    @required this.accounts,
  }) : super(key: key);

  @override
  _ManageAccountsState createState() => _ManageAccountsState();
}

class _ManageAccountsState extends State<ManageAccounts> {
  @override
  Widget build(BuildContext context) {
    String currency = '\$';

    // displays all the widgets on scren using a ListView to provide scrolling
    return ListView(
      children: <Widget>[
        AccountOverview(
          currency: currency,
          totalDebt: widget.totalDebt,
          totalBalance: widget.totalBalance,
        ),
        // needs to have a height set as we are
        // inside a widget with unbound height
        Container(
          height: 120.0,
          child: SpendingChart(
            data: widget.chartData,
          ),
        ),
        // the horizontal list of credit cards
        CardList(
          currency: currency,
          creditCards: widget.creditCards,
        ),
        // the vertical list of accounts
        AccountList(
          currency: currency,
          accounts: widget.accounts,
        ),
      ],
    );
  }
}
