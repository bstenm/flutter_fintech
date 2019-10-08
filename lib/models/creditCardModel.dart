class CreditCardModel {
  final String type;
  final String lastDigits;
  // TODO: expiry date as a date
  final String expiryDate;
  final int currentCredit;

  CreditCardModel({
    this.currentCredit,
    this.type,
    this.lastDigits,
    this.expiryDate,
  });

  factory CreditCardModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return CreditCardModel(
      type: json['type'],
      expiryDate: json['expiryDate'],
      currentCredit: json['currentCredit'],
      lastDigits: json['lastDigits'],
    );
  }
}
