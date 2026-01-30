import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:expense_tracker/feature/expense/data/tables/user_tables.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());
  @override
  int get schemaVersion => 1;

  // User queries
  Future<User?> getUser() {
    return select(users).getSingleOrNull();
  }

  Future<void> insertUser(UsersCompanion user) {
    return into(users).insertOnConflictUpdate(user);
  }
}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'expense_app.db'));
    return NativeDatabase(file);
  });
}
