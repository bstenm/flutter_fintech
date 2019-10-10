import 'package:flutter/material.dart';

import '../models/bankAccountModel.dart';
import '../models/creditCardModel.dart';
import '../models/spendingDataModel.dart';
import '../widgets/SpendingChart.dart';
import '../widgets/AccountList.dart';
import '../widgets/CardList.dart';
import '../widgets/AccountOverview.dart';

class ManageAccounts extends StatelessWidget {
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
  Widget build(BuildContext context) {
    // displays all the widgets on scren using a ListView to provide scrolling
    return ListView(
      // for integration tests
      key: Key('screen'),
      children: <Widget>[
        AccountOverview(
          totalDebt: totalDebt,
          totalBalance: totalBalance,
        ),
        // needs to have a height set as we are
        // inside a widget with unbound height
        Container(
          height: 120.0,
          child: SpendingChart(
            data: chartData,
          ),
        ),
        // the horizontal list of credit cards
        CardList(
          creditCards: creditCards,
        ),
        // the vertical list of accounts
        AccountList(
          accounts: accounts,
        ),
      ],
    );
  }
}
