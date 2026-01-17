import 'package:drift/drift.dart';

class UsersTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
