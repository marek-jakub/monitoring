import 'package:drift/drift.dart';

/// A model of ring order.
class OrderEntity extends Table {
  // non-nullable
  IntColumn get id => integer().autoIncrement()();
  TextColumn get ringerId => text()();
  TextColumn get ringSeriesCode => text()();
  IntColumn get amount => integer()();
}
