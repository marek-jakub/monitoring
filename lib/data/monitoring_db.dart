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

  /// Deletes session data.
  ///
  /// @param id A session id.
  Future<int> deleteSession(int id) async {
    // Delete all rings with the session's id.
    //(delete(ringEntity)..where((tbl) => tbl.sessionId.equals(id))).go();
    return (delete(sessionEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  ////////// LOCATION ENTITY

  /// Saves location data.
  ///
  /// @param companion A location entity companion.
  ///
  /// Returns an integer, on success an ID of the saved companion, otherwise
  /// returns 0.
  Future<int> saveLocation(LocationEntityCompanion companion) async {
    return await into(locationEntity).insert(companion);
  }

  /// Returns location data.
  ///
  /// @param id A location id.
  Future<LocationEntityData> getLocationById(int id) async {
    return await (select(locationEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  /// Updates location data.
  ///
  /// @param companion A location entity companion.
  Future<bool> updateLocation(LocationEntityCompanion companion) async {
    return await update(locationEntity).replace(companion);
  }

  /// Deletes location data.
  ///
  /// @param id A location id.
  Future<int> deleteLocation(int id) async {
    return (delete(locationEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  ////////// RING ENTITY

  /// Saves ring data.
  ///
  /// @param companion A ring entity companion.
  ///
  /// Returns an integer, on success an ID of the saved companion, otherwise
  /// returns 0.
  Future<int> saveRing(RingEntityCompanion companion) async {
    return await into(ringEntity).insert(companion);
  }

  /// Returns a stream of ring data for a given session as a list.
  ///
  /// @param id A session id.
  Stream<List<RingEntityData>> watchSessionRings(int id) {
    return (select(ringEntity)..where((tbl) => tbl.sessionId.equals(id)))
        .watch();
  }

  /// Returns ring data.
  ///
  /// @param id A ring id.
  Future<RingEntityData> getRing(int id) async {
    return await (select(ringEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  /// Updates ring data.
  ///
  /// @param companion A ring entity companion.
  Future<bool> updateRing(RingEntityCompanion companion) async {
    return await update(ringEntity).replace(companion);
  }

  /// Deletes ring data.
  ///
  /// @param id A ring id.
  Future<int> deleteRing(int id) async {
    return (delete(ringEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  ////////// RETRAP ENTITY

  /// Saves retrap ring data.
  ///
  /// @param companion A retrap entity companion.
  ///
  /// Returns an integer, on success an ID of the saved companion, otherwise
  /// returns 0.
  Future<int> saveRetrap(RetrapEntityCompanion companion) async {
    return await into(retrapEntity).insert(companion);
  }

  /// Returns a stream of retrap data for a given session as a list.
  ///
  /// @param id A session id.
  Stream<List<RetrapEntityData>> watchSessionRetraps(int id) {
    return (select(retrapEntity)..where((tbl) => tbl.sessionId.equals(id)))
        .watch();
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
