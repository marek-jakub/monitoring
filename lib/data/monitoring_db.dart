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
  // The initiator for app release
  MonRingDb() : super(_openConnection());

  // The initiator with QueryExecutor is for testing purposes
  //MonRingDb(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  // SESSION - LOCATION VIEW

  /// Returns a stream of list containing session - location view.
  ///
  /// The data is ordered on session id, descending.
  Stream<List<SessionLocationViewData>> watchSessionLocationView() {
    return (select(sessionLocationView)
          ..orderBy(
              [(t) => OrderingTerm(expression: t.id, mode: OrderingMode.desc)]))
        .watch();
  }

  /// Returns an entry of session - location view, given by session [id].
  Future<SessionLocationViewData> getSessionLocationById(int id) async {
    return await (select(sessionLocationView)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  // SESSION ENTITY

  /// Saves session data in the [companion].
  ///
  /// Returns an integer, on success an ID of the saved companion, otherwise
  /// returns 0.
  Future<int> saveSession(SessionEntityCompanion companion) async {
    return await into(sessionEntity).insert(companion);
  }

  /// Returns session data identified by [id].
  Future<SessionEntityData> getSession(int id) async {
    return await (select(sessionEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  /// Updates session data stored in the [companion].
  Future<bool> updateSession(SessionEntityCompanion companion) async {
    return await update(sessionEntity).replace(companion);
  }

  /// Deletes session data identified by [id].
  Future<int> deleteSession(int id) async {
    // Delete all rings with the session's id.
    //(delete(ringEntity)..where((tbl) => tbl.sessionId.equals(id))).go();
    return (delete(sessionEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  // LOCATION ENTITY

  /// Saves location data in the [companion].
  ///
  /// Returns an integer, on success an ID of the saved companion, otherwise
  /// returns 0.
  Future<int> saveLocation(LocationEntityCompanion companion) async {
    return await into(locationEntity).insert(companion);
  }

  /// Returns location data identified by [id].
  Future<LocationEntityData> getLocationById(int id) async {
    return await (select(locationEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  /// Updates location data given in the [companion].
  Future<bool> updateLocation(LocationEntityCompanion companion) async {
    return await update(locationEntity).replace(companion);
  }

  /// Deletes location data identified by [id].
  Future<int> deleteLocation(int id) async {
    return (delete(locationEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  // RING ENTITY

  /// Return all rings saved in the database.
  Future<List<RingEntityData>> getAllRings() async {
    return await select(ringEntity).get();
  }

  /// Saves ring data stored in the [companion].
  ///
  /// Returns an integer, on success an ID of the saved companion, otherwise
  /// returns 0.
  Future<int> saveRing(RingEntityCompanion companion) async {
    return await into(ringEntity).insert(companion);
  }

  /// Returns a stream of ring data for a given session identified by [id].
  Stream<List<RingEntityData>> watchSessionRings(int id) {
    return (select(ringEntity)..where((tbl) => tbl.sessionId.equals(id)))
        .watch();
  }

  /// Returns ring data identified by [id].
  Future<RingEntityData> getRing(int id) async {
    return await (select(ringEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  /// Updates ring data stored in the [companion].
  Future<bool> updateRing(RingEntityCompanion companion) async {
    return await update(ringEntity).replace(companion);
  }

  /// Deletes ring data identified by [id].
  Future<int> deleteRing(int id) async {
    return (delete(ringEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  // RETRAP ENTITY

  /// Saves retrap ring data stored in the [companion].
  ///
  /// Returns an integer, on success an ID of the saved companion, otherwise
  /// returns 0.
  Future<int> saveRetrap(RetrapEntityCompanion companion) async {
    return await into(retrapEntity).insert(companion);
  }

  /// Returns a stream of retrap data for a session identified by [id].
  Stream<List<RetrapEntityData>> watchSessionRetraps(int id) {
    return (select(retrapEntity)..where((tbl) => tbl.sessionId.equals(id)))
        .watch();
  }

  /// Returns retrap data identified by [id].
  Future<RetrapEntityData> getRetrap(int id) async {
    return await (select(retrapEntity)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  /// Updates retrap data stored in the [companion].
  Future<bool> updateRetrap(RetrapEntityCompanion companion) async {
    return await update(retrapEntity).replace(companion);
  }

  /// Deletes retrap data identified by [id].
  Future<int> deleteRetrap(int id) async {
    return (delete(retrapEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  // RINGSERIES ENTITY

  /// Saves ring series data stored in the [companion].
  ///
  /// Returns an integer, on success an ID of the saved companion, otherwise
  /// returns 0.
  Future<int> saveRingSeries(RingseriesEntityCompanion companion) async {
    return await into(ringseriesEntity).insert(companion);
  }

  /// Returns a stream of ring series data for a ringer identified by [id].
  Stream<List<RingseriesEntityData>> watchRingSeries(String id) {
    return (select(ringseriesEntity)..where((tbl) => tbl.ringerId.equals(id)))
        .watch();
  }

  /// Updates ring series data stored in the [companion].
  Future<bool> updateRingSeries(RingseriesEntityCompanion companion) async {
    return await update(ringseriesEntity).replace(companion);
  }

  /// Deletes ring series data identified by [id].
  Future<int> deleteRingSeries(int id) async {
    return (delete(ringseriesEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  // USEDRING ENTITY
  // TODO: define used ring access methods

  // ORDER ENTITY

  /// Saves order data stored in the [companion].
  ///
  /// Returns an integer, on success an ID of the saved companion, otherwise
  /// returns 0.
  Future<int> saveOrder(OrderEntityCompanion companion) async {
    return await into(orderEntity).insert(companion);
  }

  /// Returns a stream of order data for a ringer identified by [id].
  Stream<List<OrderEntityData>> watchOrders(String id) {
    return (select(orderEntity)..where((tbl) => tbl.ringerId.equals(id)))
        .watch();
  }

  /// Updates order data stored in the [companion].
  Future<bool> updateOrder(OrderEntityCompanion companion) async {
    return await update(orderEntity).replace(companion);
  }

  /// Deletes order data identified by [id].
  Future<int> deleteOrder(int id) async {
    return (delete(orderEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  // LOSTRING ENTITY

  /// Saves lost ring data stored in the [companion].
  ///
  /// Returns an integer, on success an ID of the saved companion, otherwise
  /// returns 0.
  Future<int> saveLostRing(LostRingEntityCompanion companion) async {
    return await into(lostRingEntity).insert(companion);
  }

  /// Returns a stream of lost ring data for a ringer identified by [id].
  Stream<List<LostRingEntityData>> watchLostRings(String id) {
    return (select(lostRingEntity)..where((tbl) => tbl.ringerId.equals(id)))
        .watch();
  }

  /// Updates lost ring data stored in the [companion].
  Future<bool> updateLostRing(LostRingEntityCompanion companion) async {
    return await update(lostRingEntity).replace(companion);
  }

  /// Deletes lost ring data identified by [id].
  Future<int> deleteLostRing(int id) async {
    return (delete(lostRingEntity)..where((tbl) => tbl.id.equals(id))).go();
  }

  // REPORT ENTITY
  // TODO: define report access methods
}

/// Access to the file holding ringing data.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db_c.sqlite'));

    //return NativeDatabase.createInBackground(file);
    return NativeDatabase(file);
  });
}

/// A view of joined tables SessionEntity and LocationEntity.
abstract class SessionLocationView extends View {
  SessionEntity get aSession;
  LocationEntity get aLocation;

  Expression<int> get locationId => aLocation.id;
  Expression<String> get locationRingerId => aLocation.ringerId;
  Expression<String> get locationCountry => aLocation.country;
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
        locationRingerId,
        locationCountry,
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
