class ExpenseScreen {
  final int id;
  final String category;
  final double amount;
  final String description;
  final String wallet;

  ExpenseScreen({
    required this.id,
    required this.category,
    required this.amount,
    required this.description,
    required this.wallet,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'amount': amount,
      'description': description,
      'wallet': wallet,
    };
  }
}
