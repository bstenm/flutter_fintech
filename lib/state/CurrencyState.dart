import 'package:flutter/widgets.dart';

class CurrencyState with ChangeNotifier {
  String _selected = 'dollar';

  Map<String, String> _currencyToSymbol = {
    'dollar': '\$',
    'pound': '£',
    'euro': '€',
  };

  String get selected => _selected;

  String get symbol => _currencyToSymbol[_selected];

  set selected(String selected) {
    _selected = selected;
    notifyListeners();
  }
}
