import 'package:expense_tracker/features/user/domain/models/user.dart';

abstract class UserRepository {
  Future<User?> getUser();
  Future<void> saveUser(User user);
  Future<void> cleanUser();
}
