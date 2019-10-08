class SpendingDataModel {
  final DateTime time;
  final int spending;

  SpendingDataModel({this.time, this.spending});

  factory SpendingDataModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return SpendingDataModel(
      time: DateTime(json['year'], json['month']),
      spending: json['amount'],
    );
  }
}
