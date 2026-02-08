import '../models/transaction.dart';

const double mockBalance = 12580.50;
const double mockEarnings = 342.18;

const List<String> quickActions = [
  'Pix',
  'Investimentos',
  'Cartões',
  'Investir em CDB',
  'Investir em Tesouro',
];

final List<Transaction> mockTransactions = [
  Transaction(
    id: '1',
    title: 'Transferência recebida',
    amount: 500.00,
    date: DateTime(2025, 2, 5, 14, 30),
    type: TransactionType.credit,
  ),
  Transaction(
    id: '2',
    title: 'Pagamento PIX',
    amount: 89.90,
    date: DateTime(2025, 2, 4, 9, 15),
    type: TransactionType.debit,
  ),
  Transaction(
    id: '3',
    title: 'Rendimento CDB',
    amount: 42.50,
    date: DateTime(2025, 2, 3, 6, 0),
    type: TransactionType.credit,
  ),
  Transaction(
    id: '4',
    title: 'Supermercado',
    amount: 256.40,
    date: DateTime(2025, 2, 2, 18, 45),
    type: TransactionType.debit,
  ),
  Transaction(
    id: '5',
    title: 'Depósito',
    amount: 1000.00,
    date: DateTime(2025, 2, 1, 10, 0),
    type: TransactionType.credit,
  ),
];
