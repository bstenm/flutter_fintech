import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/spendingDataModel.dart';
import '../models/creditCardModel.dart';
import '../models/bankAccountModel.dart';
import '../widgets/ManageAccounts.dart';
import '../models/NavigationItemModel.dart';
import '../widgets/BottomNavigation.dart';

const List<NavigationItemModel> navigationItems = <NavigationItemModel>[
  NavigationItemModel(title: 'Transactions', icon: Icons.show_chart),
  NavigationItemModel(title: 'Accounts', icon: Icons.account_balance_wallet),
  NavigationItemModel(title: 'Event', icon: Icons.event),
  NavigationItemModel(title: 'More', icon: Icons.more_horiz)
];

class ManageAccountsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        navigationItems: navigationItems,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Could not retrieve data.',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            DocumentSnapshot data = snapshot.data.documents[0];

            int totalDebt = data['totalDebt'];
            int totalBalance = data['totalBalance'];

            List<SpendingDataModel> chartData =
                data['spendingData'].map<SpendingDataModel>((dataPoint) {
              return SpendingDataModel.fromJson(
                  Map<String, dynamic>.from(dataPoint));
            }).toList();

            List<CreditCardModel> creditCards =
                data['creditCards'].map<CreditCardModel>((creditCard) {
              return CreditCardModel.fromJson(
                  Map<String, dynamic>.from(creditCard));
            }).toList();

            List<BankAccountModel> accounts =
                data['bankAccounts'].map<BankAccountModel>((account) {
              return BankAccountModel.fromJson(
                  Map<String, dynamic>.from(account));
            }).toList();

            return SafeArea(
              child: ManageAccounts(
                chartData: chartData,
                totalDebt: totalDebt,
                totalBalance: totalBalance,
                creditCards: creditCards,
                accounts: accounts,
              ),
            );
          }),
    );
  }
}
