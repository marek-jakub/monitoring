import 'package:drift/drift.dart';

/// A model of bird ringing report.
class ReportEntity extends Table {
  // non-nullable
  IntColumn get id => integer().autoIncrement()();
  TextColumn get ringerId => text()();
  TextColumn get date => text()();
}
