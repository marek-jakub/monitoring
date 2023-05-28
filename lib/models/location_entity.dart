import 'package:drift/drift.dart';

class LocationEntity extends Table {
  // non-nullable
  IntColumn get id => integer().autoIncrement()();
  TextColumn get locality => text()();
  TextColumn get placeCode => text()();
  TextColumn get latitude => text()();
  TextColumn get longitude => text()();
  TextColumn get coordinatesAccuracy => text()();

  // can be empty strings
  TextColumn get localeInfo => text()();
}
