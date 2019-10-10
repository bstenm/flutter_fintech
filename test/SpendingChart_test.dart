import 'package:flutter/material.dart';
import 'package:flutter_fintech/models/spendingDataModel.dart';
import 'package:flutter_fintech/state/CurrencyState.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fintech/widgets/SpendingChart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        builder: (_) => CurrencyState(),
        child: MaterialApp(
          home: SpendingChart(
            data: [
              SpendingDataModel.fromJson({
                'year': 2019,
                'month': 4,
                'amount': 26,
              }),
              SpendingDataModel.fromJson({
                'year': 2019,
                'month': 5,
                'amount': 29,
              })
            ],
          ),
        ),
      ),
    );

    // Verify a time series chart is displayed
    expect(find.byType(charts.TimeSeriesChart), findsOneWidget);
  });
}
