import 'package:spend_wise/feature/expense/domain/entities/transaction_type.dart';

class CategoryEntity {
  final String categoryId;
  final String categoryName;
  final TransactionType type;

  CategoryEntity({
    required this.categoryId,
    required this.categoryName,
    required this.type,
  });
}
