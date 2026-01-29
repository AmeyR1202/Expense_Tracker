import 'package:expense_tracker/feature/expense/domain/entities/transaction_entity.dart';
import 'package:expense_tracker/feature/expense/domain/repositories/transaction_repository.dart';

class AddTransactionUseCase {
  final TransactionRepository repository;

  AddTransactionUseCase({required this.repository});

  Future<void> call(TransactionEntity transaction) {
    return repository.addTransaction(transaction);
  }
}
