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

    return ListView(
      children: <Widget>[
        AccountOverview(
          currency: currency,
          totalDebt: widget.totalDebt,
          totalBalance: widget.totalBalance,
        ),
        Container(
          height: 120.0,
          child: SpendingChart(
            data: widget.chartData,
          ),
        ),
        CardList(
          currency: currency,
          creditCards: widget.creditCards,
        ),
        AccountList(
          currency: currency,
          accounts: widget.accounts,
        ),
      ],
    );
  }
}
