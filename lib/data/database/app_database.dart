import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:expense_tracker/data/tables/users_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [UsersTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          driftDatabase(
            name: 'app.db',
          ),
        );

  @override
  int get schemaVersion => 3;
}
