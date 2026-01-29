import 'package:expense_tracker/feature/expense/domain/entities/user_entity.dart';
import 'package:expense_tracker/feature/expense/domain/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase({required this.repository});

  Future<UserEntity?> call() {
    return repository.getUser();
  }
}
