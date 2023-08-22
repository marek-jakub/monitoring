import 'package:drift/drift.dart';

/// A model of used ring.
class UsedRingEntity extends Table {
  // non-nullable
  IntColumn get id => integer().autoIncrement()();
  TextColumn get ringerId => text()();
  TextColumn get ringSeriesCode => text()();
  TextColumn get idNumber => text()();
}
