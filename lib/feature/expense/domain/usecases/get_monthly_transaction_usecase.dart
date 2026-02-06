import 'package:spend_wise/feature/expense/domain/entities/transaction_entity.dart';
import 'package:spend_wise/feature/expense/domain/repositories/transaction_repository.dart';

class GetMonthlyTransactionUseCase {
  final TransactionRepository repository;

  GetMonthlyTransactionUseCase({required this.repository});

  Future<List<TransactionEntity>> call(DateTime month) {
    return repository.getTransactionsForMonth(month);
  }
}
