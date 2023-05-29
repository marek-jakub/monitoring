import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../models/models.dart';

part 'monitoring_db.g.dart';

/// An sqlite database, used for offline data persistence.
///
/// Utilizes table entities given in [tables]
@DriftDatabase(tables: [
  LocationEntity,
  LostRingEntity,
  OrderEntity,
  ReportEntity,
  RetrapEntity,
  RingEntity,
  RingseriesEntity,
  SessionEntity,
  UsedRingEntity
], views: [
  SessionLocationView
])
class MonRingDb extends _$MonRingDb {
  MonRingDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  ////////// SESSION ENTITY

  /// Saves session data.
  ///
  /// @param companion A session entity companion.
  ///
  /// Returns an integer, on success an ID of the saved companion, otherwise
  /// returns 0.
  Future<int> saveSession(SessionEntityCompanion companion) async {
    return await into(sessionEntity).insert(companion);
  }

  /// Returns session data.
  ///
  /// @param id A session id.
  Future<SessionEntityData> getSession(int id) async {
    return await (select(sessionEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  /// Updates session data.
  ///
  /// @param companion A session entity companion.
  Future<bool> updateSession(SessionEntityCompanion companion) async {
    return await update(sessionEntity).replace(companion);
  }

  // TODO: define database access methods
}

/// Access to the file holding ringing data.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db_a.sqlite'));

    //return NativeDatabase.createInBackground(file);
    return NativeDatabase(file);
  });
}

/// A view of joined tables SessionEntity and LocationEntity.
abstract class SessionLocationView extends View {
  SessionEntity get aSession;
  LocationEntity get aLocation;

  Expression<int> get locationId => aLocation.id;
  Expression<String> get locationLocality => aLocation.locality;
  Expression<String> get locationPlaceCode => aLocation.placeCode;
  Expression<String> get locationLat => aLocation.latitude;
  Expression<String> get locationLon => aLocation.longitude;
  Expression<String> get locationCoordAccuracy => aLocation.coordinatesAccuracy;
  Expression<String> get locationInfo => aLocation.localeInfo;

  @override
  Query as() => select([
        aSession.id,
        aSession.ringerId,
        aSession.date,
        aSession.dateAccuracy,
        aSession.location,
        aSession.startTime,
        aSession.endTime,
        locationId,
        locationLocality,
        locationPlaceCode,
        locationLat,
        locationLon,
        locationCoordAccuracy,
        locationInfo,
      ]).from(aSession).join([
        leftOuterJoin(aLocation, aSession.location.equalsExp(aLocation.id))
      ]);
}
