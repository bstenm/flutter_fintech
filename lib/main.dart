import 'package:flutter/material.dart';

import 'screens/ManageAccounts.dart';

void main() => runApp(FinTechApp());

class FinTechApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintech app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway',
      ),
      home: ManageAccountsScreen(),
    );
  }
}
