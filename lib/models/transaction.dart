enum TransactionType { credit, debit }

class Transaction {
  const Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
  });

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final TransactionType type;

  String get formattedAmount {
    final prefix = type == TransactionType.credit ? '+ ' : '- ';
    return '$prefix R\$${amount.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  String get formattedDate {
    const months = [
      'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun',
      'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
