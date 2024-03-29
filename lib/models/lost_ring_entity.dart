import 'package:drift/drift.dart';

/// A model of lost ring.
class LostRingEntity extends Table {
  // non-nullable
  IntColumn get id => integer().autoIncrement()();
  TextColumn get ringerId => text()();
  TextColumn get schemeCode => text()();
  TextColumn get ringSeriesCode => text()();
  TextColumn get idNumber => text()();
}
