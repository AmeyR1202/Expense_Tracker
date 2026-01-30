import 'package:expense_tracker/feature/expense/data/datasources/user_local_data_source.dart';
import 'package:expense_tracker/feature/expense/domain/entities/user_entity.dart';
import 'package:expense_tracker/feature/expense/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl(this.localDataSource);

  @override
  Future<UserEntity?> getUser() async {
    final user = await localDataSource.getUser();
    if (user == null) return null;

    return UserEntity(user.id, user.name);
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    return localDataSource.saveUser(id: user.id, name: user.name);
  }
}
