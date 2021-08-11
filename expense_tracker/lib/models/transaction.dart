class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;
  Transaction(this.title, this.amount, {this.id, this.date});
  Transaction.create(title, amount)
      : this(title, amount,
            id: DateTime.now().toIso8601String(), date: DateTime.now());
}
