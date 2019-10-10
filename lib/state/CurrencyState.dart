import 'package:flutter/widgets.dart';
import 'package:flutter_fintech/utils.dart';

class CurrencyState with ChangeNotifier {
  Currency _selected = Currency.dollar;

  Map<Currency, String> _currencyToSymbol = {
    Currency.dollar: '\$',
    Currency.pound: '£',
    Currency.euro: '€',
  };

  Currency get selected => _selected;

  String get symbol => _currencyToSymbol[_selected];

  set selected(Currency selected) {
    _selected = selected;
    notifyListeners();
  }
}
