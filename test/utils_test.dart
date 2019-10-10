import 'package:flutter_fintech/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('showDataOrPlaceholder', () {
    test('Returns the data if not null', () {
      expect(showDataOrPlaceholder('some_data'), 'some_data');
    });

    test('Returns the data as a string', () {
      expect(showDataOrPlaceholder(5), '5');
    });

    test('Returns the placeholder if data passed is null', () {
      expect(showDataOrPlaceholder(null), '--');
    });
  });
  group('currencyConverter', () {
    test('Returns null if data passed is null', () {
      expect(currencyConverter(null, 'dollar'), null);
    });

    test('Returns the amount corresponding to currency passed', () {
      expect(currencyConverter(100, 'pound'), 81);
      expect(currencyConverter(100, 'euro'), 91);
    });
  });
}
