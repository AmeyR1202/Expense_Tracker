import 'package:spend_wise/core/state/status.dart';
import 'package:spend_wise/feature/expense/domain/entities/category_entity.dart';
import 'package:spend_wise/feature/expense/domain/entities/transaction_type.dart';
import 'package:spend_wise/feature/expense/presentation/add_transaction/flow/add_transaction_step.dart';

class AddTransactionState {
  final AddTransactionStep step;
  final TransactionType? type;
  final double amount;
  final CategoryEntity? category;
  final String? notes;
  final Status status;

  const AddTransactionState({
    required this.step,
    this.type,
    this.amount = 0.0,
    this.category,
    this.notes,
    this.status = Status.initial,
  });

  factory AddTransactionState.initial() {
    return AddTransactionState(step: AddTransactionStep.chooseType);
  }

  AddTransactionState copyWith({
    AddTransactionStep? step,
    TransactionType? type,
    double? amount,
    CategoryEntity? category,
    String? notes,
    Status? status,
  }) {
    return AddTransactionState(
      step: step ?? this.step,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      notes: notes ?? this.notes,
      status: status ?? this.status,
    );
  }
}
