class BankAccountModel {
  final String type;
  final String bankName;
  final double balance;

  BankAccountModel({
    this.type,
    this.bankName,
    this.balance,
  });

  factory BankAccountModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }

    return BankAccountModel(
      type: json['type'],
      bankName: json['bankName'],
      balance: json['balance'],
    );
  }
}
