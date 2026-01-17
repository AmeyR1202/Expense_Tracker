import 'package:drift/drift.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/features/user/domain/models/user.dart';
import 'package:expense_tracker/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final AppDatabase db;

  UserRepositoryImpl({required this.db});

  @override
  Future<User?> getUser() async {
    final query = db.select(db.usersTable)..limit(1);

    final result = await query.getSingleOrNull();

    if (result == null) return null;
    return User(name: result.name);
  }

  @override
  Future<void> saveUser(User user) async {
    await db.into(db.usersTable).insert(
          UsersTableCompanion.insert(name: user.name),
          mode: InsertMode.insertOrReplace,
        );
  }

  @override
  Future<void> cleanUser() async {
    await db.delete(db.usersTable).go();
  }
}
