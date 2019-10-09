import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Manage Accounts Screen', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Displays the total balance', () async {
      final totalBalance = find.byValueKey('total_balance');
      expect(await driver.getText(totalBalance), '41880');
    });

    test('Displays the total debt', () async {
      final totalDebt = find.byValueKey('total_debt');
      expect(await driver.getText(totalDebt), '\$ 3200');
    });

    test('Displays a section header for the credit card list', () async {
      final btn = find.byValueKey('card_list_manage_btn');
      final header = find.byValueKey('card_list_section_header');
      expect(await driver.getText(btn), 'Manage');
      expect(await driver.getText(header), 'Credit cards');
    });

    test(
        'Shows dialog box on tapping the "Manage" btn for the credit card list',
        () async {
      final btn = find.byValueKey('card_list_manage_btn');
      await driver.tap(btn);
      final dialog = find.byValueKey('card_list_dialog');
      expect(await driver.getText(dialog), 'Manage your cards');
    });

    test('Displays the list of credit cards', () async {
      final creditCardsList = find.byValueKey('credit_card_list');
      final firstCardType = find.byValueKey('card_0_type');
      final firstCardCredit = find.byValueKey('card_0_credit');
      final firstCardNumber = find.byValueKey('card_0_number');
      final firstCardExpiryDate = find.byValueKey('card_0_expiry_date');
      final secondCardCredit = find.byValueKey('card_1_credit');

      // verify that the 1st credit card is inside the viewport
      expect(await driver.getText(firstCardCredit), '2300');
      expect(await driver.getText(firstCardType), 'visa');
      expect(await driver.getText(firstCardNumber), '****  ****  ****  2345');
      expect(await driver.getText(firstCardExpiryDate), '10/24');

      // we scroll to the second one
      await driver.scrollUntilVisible(
        creditCardsList,
        secondCardCredit,
        // scroll that much horizontally
        dxScroll: -200.0,
      );

      // verify that the 3rd credit card is inside the viewport
      expect(await driver.getText(secondCardCredit), '85');
    });

    test('Displays a section header for the bank account list', () async {
      final btn = find.byValueKey('account_list_manage_btn');
      final header = find.byValueKey('account_list_section_header');
      expect(await driver.getText(btn), 'Manage');
      expect(await driver.getText(header), 'Bank accounts');
    });

    test('Displays the list of bank accounts', () async {
      final screen = find.byValueKey('screen');
      final firstAccountType = find.byValueKey('Checking_account_type');
      final firstAccountBalance = find.byValueKey('Checking_account_balance');
      final firstAccountBankName =
          find.byValueKey('Checking_account_bank_name');
      final thirdAccountBalance = find.byValueKey('Current_account_balance');

      // we scroll to the third one
      await driver.scrollUntilVisible(
        screen,
        thirdAccountBalance,
        // scroll that much vertically
        dyScroll: -150.0,
      );

      // verify that the 1st bank account is inside the viewport
      expect(await driver.getText(firstAccountType), 'Checking account');
      expect(await driver.getText(firstAccountBalance), '\$1253.23');
      expect(await driver.getText(firstAccountBankName), 'Bank of America');

      // verify that the 3rd bank account is inside the viewport
      expect(await driver.getText(thirdAccountBalance), '\$1.34');
    });
  });
}
