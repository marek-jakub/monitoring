import 'package:drift/drift.dart';

/// A model of ring series.
class RingseriesEntity extends Table {
  // non-nullable
  IntColumn get id => integer().autoIncrement()();
  TextColumn get code => text()();
  TextColumn get schemeCode => text()();
  IntColumn get ringfrom => integer()();
  IntColumn get ringto => integer()();
}
