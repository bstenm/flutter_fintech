import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/spendingDataModel.dart';

class SpendingChart extends StatelessWidget {
  final List<SpendingDataModel> data;

  SpendingChart({
    Key key,
    @required this.data,
  }) : super(key: key);

  List<charts.Series<SpendingDataModel, DateTime>> _getSeriesData() {
    return [
      charts.Series<SpendingDataModel, DateTime>(
        id: 'Spending',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (SpendingDataModel spending, _) => spending.time,
        measureFn: (SpendingDataModel spending, _) => spending.spending,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: charts.TimeSeriesChart(
        _getSeriesData(),
        animate: true,
      ),
    );
  }
}
