import 'package:flutter/material.dart';
import 'package:flutter_fintech/models/NavigationItemModel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fintech/widgets/BottomNavigation.dart';

const List<NavigationItemModel> navigationItems = <NavigationItemModel>[
  NavigationItemModel(title: 'Transactions', icon: Icons.show_chart),
  NavigationItemModel(title: 'Accounts', icon: Icons.account_balance_wallet),
  NavigationItemModel(title: 'Event', icon: Icons.event),
  NavigationItemModel(title: 'More', icon: Icons.more_horiz)
];

void main() {
  testWidgets('Displays a list of links at the bottom of the screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BottomNavigation(
          navigationItems: navigationItems,
        ),
      ),
    );

    // Verify 4 icons are displayed
    expect(find.byType(Icon), findsNWidgets(4));

    // Verify all icons passed are displayed
    expect(find.byIcon(Icons.show_chart), findsOneWidget);
    expect(find.byIcon(Icons.account_balance_wallet), findsOneWidget);
    expect(find.byIcon(Icons.event), findsOneWidget);
    expect(find.byIcon(Icons.more_horiz), findsOneWidget);
  });
}
