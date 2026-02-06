import 'package:spend_wise/feature/expense/data/database/app_database.dart';

class UserLocalDataSource {
  final AppDatabase database;

  UserLocalDataSource(this.database);

  Future<User?> getUser() {
    return database.getUser();
  }

  Future<void> saveUser({required String id, required String name}) {
    return database.insertUser(UsersCompanion.insert(id: id, name: name));
  }
}
