import 'package:drift/drift.dart';

import '../models/models.dart';

/// A model of ringing session.
class SessionEntity extends Table {
  // non-nullable
  IntColumn get id => integer().autoIncrement()();
  TextColumn get date => text()();
  TextColumn get dateAccuracy => text()();
  IntColumn get location => integer().references(LocationEntity, #id)();
  TextColumn get ringerId => text()();

  // can be empty
  TextColumn get startTime => text()();
  TextColumn get endTime => text()();
}
