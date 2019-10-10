import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/CurrencyState.dart';
import 'screens/ManageAccountsScreen.dart';

void main() => runApp(FinTechApp());

class FinTechApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => CurrencyState(),
      child: MaterialApp(
        title: 'Fintech app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Raleway',
        ),
        home: ManageAccountsScreen(),
      ),
    );
  }
}
