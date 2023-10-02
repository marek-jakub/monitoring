import 'package:drift/drift.dart';

/// A model of ring in the system.
class RingsInEntity extends Table {
  // non-nullable
  IntColumn get id => integer().autoIncrement()();
  TextColumn get ringerId => text()();
  TextColumn get code => text()();
  TextColumn get schemeCode => text()();
  TextColumn get idNumber => text()();
  TextColumn get used => text()();
  TextColumn get lost => text()();
}
