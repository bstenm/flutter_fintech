import 'package:flutter_fintech/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Returns the data if not null', () {
    expect(showDataOrPlaceholder('some_data'), 'some_data');
  });

  test('Returns the data as a string', () {
    expect(showDataOrPlaceholder(5), '5');
  });

  test('Returns the placeholder if data passed is null', () {
    expect(showDataOrPlaceholder(null), '--');
  });
}
