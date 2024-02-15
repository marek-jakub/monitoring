import 'package:drift/native.dart';
import 'package:test/test.dart';
import 'package:drift/drift.dart' as d;

import 'package:monitoring/data/monitoring_db.dart';

import 'database_mock_data.dart' as mock_data;

void main() {
  late MonRingDb monRingDb;

  setUp(() {
    // On testing uncomment below and comment out initializer with no parameters.
    //monRingDb = MonRingDb(NativeDatabase.memory());
    monRingDb = MonRingDb();
  });

  tearDown(() {
    monRingDb.close();
  });

  group('Session data can be saved, updated, retrieved and deleted.', () {
    test('Session can be saved.', () async {
      final id = await monRingDb.saveSession(mock_data.sessions[0]);
      final session = await monRingDb.getSession(id);

      expect(session.id, id);
      expect(session.date.toString(), '06-06-2023');
      expect(session.dateAccuracy.toString(), '0');
      expect(session.location, 1);
      expect(session.ringerId.toString(), '6000');
      expect(session.startTime.toString(), '04:00');
      expect(session.endTime.toString(), '10:00');
    });

    test('Another session can be saved, updated and deleted.', () async {
      final id = await monRingDb.saveSession(mock_data.sessions[1]);
      final session = await monRingDb.getSession(id);

      expect(session.id, id);
      expect(session.date.toString(), '07-06-2023');
      expect(session.dateAccuracy.toString(), '1');
      expect(session.location, 2);
      expect(session.ringerId.toString(), '7000');
      expect(session.startTime.toString(), '05:00');
      expect(session.endTime.toString(), '11:00');

      final updated = await monRingDb.updateSession(
        SessionEntityCompanion(
          id: d.Value(id),
          date: const d.Value('08-06-2023'),
          dateAccuracy: const d.Value('2'),
          location: const d.Value(2),
          ringerId: const d.Value('7000'),
          startTime: const d.Value('06:00'),
          endTime: const d.Value('12:00'),
        ),
      );
      final updatedSession = await monRingDb.getSession(id);

      expect(updated, true);
      expect(updatedSession.date.toString(), '08-06-2023');
      expect(updatedSession.dateAccuracy.toString(), '2');
      expect(updatedSession.location, 2);
      expect(updatedSession.ringerId.toString(), '7000');
      expect(updatedSession.startTime.toString(), '06:00');
      expect(updatedSession.endTime.toString(), '12:00');

      final deleted = await monRingDb.deleteSession(id);

      expect(deleted, id);
    });
  });

  group('Location data can be saved, updated, retrieved and deleted.', () {
    test('Location can be saved.', () async {
      final id = await monRingDb.saveLocation(mock_data.locations[0]);
      final location = await monRingDb.getLocationById(id);

      expect(location.id, id);
      expect(location.ringerId.toString(), '6000');
      expect(location.country.toString(), 'SLOVAKIA');
      expect(location.locality.toString(), 'Great Meadow');
      expect(location.placeCode.toString(), 'SKVT');
      expect(location.latitude.toString(), '49.00');
      expect(location.longitude.toString(), '0.012');
      expect(location.coordinatesAccuracy.toString(), '0');
      expect(location.localeInfo.toString(), 'Nature reserve Great Meadow');
    });

    test('Another location can be saved, updated and deleted.', () async {
      final id = await monRingDb.saveLocation(mock_data.locations[1]);
      final location = await monRingDb.getLocationById(id);

      expect(location.id, id);
      expect(location.ringerId.toString(), '7000');
      expect(location.country.toString(), 'UNITED KINGDOM');
      expect(location.locality.toString(), 'Sandown');
      expect(location.placeCode.toString(), 'GBL');
      expect(location.latitude.toString(), '41.00');
      expect(location.longitude.toString(), '7.012');
      expect(location.coordinatesAccuracy.toString(), '1');
      expect(location.localeInfo.toString(), 'Thames sanctuary');

      final updated = await monRingDb.updateLocation(
        LocationEntityCompanion(
          id: d.Value(id),
          ringerId: const d.Value('7000'),
          country: const d.Value('SLOVAKIA'),
          locality: const d.Value('Black Forest'),
          placeCode: const d.Value('SKVT'),
          latitude: const d.Value('36.00'),
          longitude: const d.Value('19.25'),
          coordinatesAccuracy: const d.Value('2'),
          localeInfo: const d.Value('Nature reserve'),
        ),
      );
      final updatedLocation = await monRingDb.getLocationById(id);

      expect(updated, true);
      expect(updatedLocation.ringerId.toString(), '7000');
      expect(updatedLocation.country.toString(), 'SLOVAKIA');
      expect(updatedLocation.locality.toString(), 'Black Forest');
      expect(updatedLocation.placeCode.toString(), 'SKVT');
      expect(updatedLocation.latitude, '36.00');
      expect(updatedLocation.longitude.toString(), '19.25');
      expect(updatedLocation.coordinatesAccuracy.toString(), '2');
      expect(updatedLocation.localeInfo.toString(), 'Nature reserve');

      final deleted = await monRingDb.deleteLocation(id);

      expect(deleted, id);
    });
  });

  group('Ring data can be saved, updated, retrieved and deleted.', () {
    test('Ring data can be saved.', () async {
      final id = await monRingDb.saveRing(mock_data.rings[0]);
      final ring = await monRingDb.getRing(id);

      expect(ring.id, id);
      expect(ring.sessionId, 1);
      expect(ring.ringerId.toString(), '6000');
      expect(ring.primaryIdMethod.toString(), 'A0');
      expect(ring.ringSeriesCode.toString(), 'T');
      expect(ring.ringIdNumber.toString(), '44');
      expect(ring.metalRingInfo.toString(), '1');
      expect(ring.species.toString(), 'ANA.CLY');
      expect(ring.age.toString(), '3');
      expect(ring.sex.toString(), 'F');
      expect(ring.sexingMethod.toString(), 'S');
      expect(ring.otherMarks.toString(), 'ZZ');
      expect(ring.catchingMethod.toString(), 'M');
      expect(ring.catchingLures.toString(), 'N');
      expect(ring.condition.toString(), '8');
      expect(ring.circumstances.toString(), '61');
      expect(ring.circumstancesPresumed.toString(), '0');
      expect(ring.status.toString(), 'U');
      expect(ring.time.toString(), '04:55');
      expect(ring.wingLength.toString(), '122.2');
      expect(ring.thirdPrimary.toString(), '70.5');
      expect(ring.wingPointState.toString(), 'A');
      expect(ring.mass.toString(), '22.5');
      expect(ring.moult.toString(), 'M');
      expect(ring.plumageCode.toString(), 'A');
      expect(ring.hindClaw.toString(), '12.1');
      expect(ring.billLength.toString(), '20.2');
      expect(ring.billMethod.toString(), 'N');
      expect(ring.headLengthTotal.toString(), '33.5');
      expect(ring.tarsus.toString(), '26.7');
      expect(ring.tarsusMethod.toString(), 'M');
      expect(ring.tailLength.toString(), '45.5');
      expect(ring.tailDifference.toString(), '5.5');
      expect(ring.fatScore.toString(), '2');
      expect(ring.fatScoreMethod.toString(), 'B');
      expect(ring.pectoralMuscle.toString(), '1');
      expect(ring.broodPatch.toString(), '2');
      expect(ring.primaryScore.toString(), '45');
      expect(ring.primaryMoult.toString(), '0');
      expect(ring.oldGreaterCoverts.toString(), 'A');
      expect(ring.alula.toString(), '1');
      expect(ring.carpalCovert.toString(), '1');
    });

    test('Anogher ring data can be saved, updated and deleted.', () async {
      final id = await monRingDb.saveRing(mock_data.rings[1]);
      final ring = await monRingDb.getRing(id);

      expect(ring.id, id);
      expect(ring.sessionId, 1);
      expect(ring.ringerId.toString(), '6000');
      expect(ring.primaryIdMethod.toString(), 'A0');
      expect(ring.ringSeriesCode.toString(), 'C');
      expect(ring.ringIdNumber.toString(), '12');
      expect(ring.metalRingInfo.toString(), '1');
      expect(ring.species.toString(), 'SYL.ATR');
      expect(ring.age.toString(), '3');
      expect(ring.sex.toString(), 'F');
      expect(ring.sexingMethod.toString(), 'S');
      expect(ring.otherMarks.toString(), 'ZZ');
      expect(ring.catchingMethod.toString(), 'M');
      expect(ring.catchingLures.toString(), 'N');
      expect(ring.condition.toString(), '8');
      expect(ring.circumstances.toString(), '61');
      expect(ring.circumstancesPresumed.toString(), '0');
      expect(ring.status.toString(), 'U');
      expect(ring.time.toString(), '04:55');
      expect(ring.wingLength.toString(), '122.2');
      expect(ring.thirdPrimary.toString(), '70.5');
      expect(ring.wingPointState.toString(), 'A');
      expect(ring.mass.toString(), '22.5');
      expect(ring.moult.toString(), 'M');
      expect(ring.plumageCode.toString(), 'A');
      expect(ring.hindClaw.toString(), '12.1');
      expect(ring.billLength.toString(), '20.2');
      expect(ring.billMethod.toString(), 'N');
      expect(ring.headLengthTotal.toString(), '33.5');
      expect(ring.tarsus.toString(), '26.7');
      expect(ring.tarsusMethod.toString(), 'M');
      expect(ring.tailLength.toString(), '45.5');
      expect(ring.tailDifference.toString(), '5.5');
      expect(ring.fatScore.toString(), '2');
      expect(ring.fatScoreMethod.toString(), 'B');
      expect(ring.pectoralMuscle.toString(), '1');
      expect(ring.broodPatch.toString(), '2');
      expect(ring.primaryScore.toString(), '45');
      expect(ring.primaryMoult.toString(), '0');
      expect(ring.oldGreaterCoverts.toString(), 'A');
      expect(ring.alula.toString(), '1');
      expect(ring.carpalCovert.toString(), '1');

      final updated = await monRingDb.updateRing(
        RingEntityCompanion(
          id: d.Value(id),
          sessionId: const d.Value(3),
          ringerId: const d.Value('7000'),
          primaryIdMethod: const d.Value('C0'),
          ringSeriesCode: const d.Value('E'),
          ringIdNumber: const d.Value('16'),
          metalRingInfo: const d.Value('3'),
          species: const d.Value('MIL.VUS'),
          age: const d.Value('5'),
          sex: const d.Value('U'),
          sexingMethod: const d.Value('A'),
          otherMarks: const d.Value('DC'),
          catchingMethod: const d.Value('C'),
          catchingLures: const d.Value('D'),
          condition: const d.Value('7'),
          circumstances: const d.Value('33'),
          circumstancesPresumed: const d.Value('0'),
          status: const d.Value('L'),
          time: const d.Value('06:55'),
          wingLength: const d.Value('152.2'),
          thirdPrimary: const d.Value('90.5'),
          wingPointState: const d.Value('V'),
          mass: const d.Value('42.5'),
          moult: const d.Value('X'),
          plumageCode: const d.Value('U'),
          hindClaw: const d.Value('32.1'),
          billLength: const d.Value('40.2'),
          billMethod: const d.Value('C'),
          headLengthTotal: const d.Value('53.5'),
          tarsus: const d.Value('46.7'),
          tarsusMethod: const d.Value('T'),
          tailLength: const d.Value('65.5'),
          tailDifference: const d.Value('7.5'),
          fatScore: const d.Value('4'),
          fatScoreMethod: const d.Value('P'),
          pectoralMuscle: const d.Value('3'),
          broodPatch: const d.Value('4'),
          primaryScore: const d.Value('33'),
          primaryMoult: const d.Value('2'),
          oldGreaterCoverts: const d.Value('A'),
          alula: const d.Value('1'),
          carpalCovert: const d.Value('1'),
        ),
      );
      final updatedRing = await monRingDb.getRing(id);

      expect(updated, true);
      expect(updatedRing.sessionId, 3);
      expect(updatedRing.ringerId.toString(), '7000');
      expect(updatedRing.primaryIdMethod.toString(), 'C0');
      expect(updatedRing.ringSeriesCode.toString(), 'E');
      expect(updatedRing.ringIdNumber.toString(), '16');
      expect(updatedRing.metalRingInfo.toString(), '3');
      expect(updatedRing.species.toString(), 'MIL.VUS');
      expect(updatedRing.age.toString(), '5');
      expect(updatedRing.sex.toString(), 'U');
      expect(updatedRing.sexingMethod.toString(), 'A');
      expect(updatedRing.otherMarks.toString(), 'DC');
      expect(updatedRing.catchingMethod.toString(), 'C');
      expect(updatedRing.catchingLures.toString(), 'D');
      expect(updatedRing.condition.toString(), '7');
      expect(updatedRing.circumstances.toString(), '33');
      expect(updatedRing.circumstancesPresumed.toString(), '0');
      expect(updatedRing.status.toString(), 'L');
      expect(updatedRing.time.toString(), '06:55');
      expect(updatedRing.wingLength.toString(), '152.2');
      expect(updatedRing.thirdPrimary.toString(), '90.5');
      expect(updatedRing.wingPointState.toString(), 'V');
      expect(updatedRing.mass.toString(), '42.5');
      expect(updatedRing.moult.toString(), 'X');
      expect(updatedRing.plumageCode.toString(), 'U');
      expect(updatedRing.hindClaw.toString(), '32.1');
      expect(updatedRing.billLength.toString(), '40.2');
      expect(updatedRing.billMethod.toString(), 'C');
      expect(updatedRing.headLengthTotal.toString(), '53.5');
      expect(updatedRing.tarsus.toString(), '46.7');
      expect(updatedRing.tarsusMethod.toString(), 'T');
      expect(updatedRing.tailLength.toString(), '65.5');
      expect(updatedRing.tailDifference.toString(), '7.5');
      expect(updatedRing.fatScore.toString(), '4');
      expect(updatedRing.fatScoreMethod.toString(), 'P');
      expect(updatedRing.pectoralMuscle.toString(), '3');
      expect(updatedRing.broodPatch.toString(), '4');
      expect(updatedRing.primaryScore.toString(), '33');
      expect(updatedRing.primaryMoult.toString(), '2');
      expect(updatedRing.oldGreaterCoverts.toString(), 'A');
      expect(updatedRing.alula.toString(), '1');
      expect(updatedRing.carpalCovert.toString(), '1');

      final deleted = await monRingDb.deleteRing(id);

      expect(deleted, id);
    });

    test('Stream emits list of right rings.', () async {
      await monRingDb.saveRing(mock_data.rings[0]);
      await monRingDb.saveRing(mock_data.rings[1]);

      final expectation = expectLater(
          monRingDb.watchSessionRings(2).map((ringList) => ringList.length),
          emitsInOrder([0, 1]));

      await monRingDb.saveRing(mock_data.rings[2]);
      await expectation;
    });
  });

  group('Retrap data can be saved, updated, retrieved and deleted.', () {
    test('Retrap data can be saved.', () async {
      final id = await monRingDb.saveRetrap(mock_data.retraps[0]);
      final retrap = await monRingDb.getRetrap(id);

      expect(retrap.id, id);
      expect(retrap.sessionId, 1);
      expect(retrap.ringerId.toString(), '6000');
      expect(retrap.ringScheme.toString(), 'GBT');
      expect(retrap.primaryIdMethod.toString(), 'A0');
      expect(retrap.ringSeriesCode.toString(), 'C');
      expect(retrap.ringIdNumber.toString(), '12');
      expect(retrap.metalRingInfo.toString(), '1');
      expect(retrap.species.toString(), 'SYL.ATR');
      expect(retrap.age.toString(), '3');
      expect(retrap.sex.toString(), 'F');
      expect(retrap.sexingMethod.toString(), 'S');
      expect(retrap.otherMarks.toString(), 'ZZ');
      expect(retrap.catchingMethod.toString(), 'M');
      expect(retrap.catchingLures.toString(), 'N');
      expect(retrap.condition.toString(), '8');
      expect(retrap.circumstances.toString(), '61');
      expect(retrap.circumstancesPresumed.toString(), '0');
      expect(retrap.status.toString(), 'U');
      expect(retrap.time.toString(), '04:55');
      expect(retrap.wingLength.toString(), '122.2');
      expect(retrap.thirdPrimary.toString(), '70.5');
      expect(retrap.wingPointState.toString(), 'A');
      expect(retrap.mass.toString(), '22.5');
      expect(retrap.moult.toString(), 'M');
      expect(retrap.plumageCode.toString(), 'A');
      expect(retrap.hindClaw.toString(), '12.1');
      expect(retrap.billLength.toString(), '20.2');
      expect(retrap.billMethod.toString(), 'N');
      expect(retrap.headLengthTotal.toString(), '33.5');
      expect(retrap.tarsus.toString(), '26.7');
      expect(retrap.tarsusMethod.toString(), 'M');
      expect(retrap.tailLength.toString(), '45.5');
      expect(retrap.tailDifference.toString(), '5.5');
      expect(retrap.fatScore.toString(), '2');
      expect(retrap.fatScoreMethod.toString(), 'B');
      expect(retrap.pectoralMuscle.toString(), '1');
      expect(retrap.broodPatch.toString(), '2');
      expect(retrap.primaryScore.toString(), '45');
      expect(retrap.primaryMoult.toString(), '0');
      expect(retrap.oldGreaterCoverts.toString(), 'A');
      expect(retrap.alula.toString(), '1');
      expect(retrap.carpalCovert.toString(), '1');
    });

    test('Anogher retrap data can be saved, updated and deleted.', () async {
      final id = await monRingDb.saveRetrap(mock_data.retraps[1]);
      final retrap = await monRingDb.getRetrap(id);

      expect(retrap.id, id);
      expect(retrap.sessionId, 2);
      expect(retrap.ringerId.toString(), '7000');
      expect(retrap.ringScheme.toString(), 'SKB');
      expect(retrap.primaryIdMethod.toString(), 'B0');
      expect(retrap.ringSeriesCode.toString(), 'D');
      expect(retrap.ringIdNumber.toString(), '14');
      expect(retrap.metalRingInfo.toString(), '2');
      expect(retrap.species.toString(), 'EMB.LLA');
      expect(retrap.age.toString(), '4');
      expect(retrap.sex.toString(), 'M');
      expect(retrap.sexingMethod.toString(), 'U');
      expect(retrap.otherMarks.toString(), 'BB');
      expect(retrap.catchingMethod.toString(), 'A');
      expect(retrap.catchingLures.toString(), 'F');
      expect(retrap.condition.toString(), '6');
      expect(retrap.circumstances.toString(), '44');
      expect(retrap.circumstancesPresumed.toString(), '1');
      expect(retrap.status.toString(), 'N');
      expect(retrap.time.toString(), '05:55');
      expect(retrap.wingLength.toString(), '142.2');
      expect(retrap.thirdPrimary.toString(), '80.5');
      expect(retrap.wingPointState.toString(), 'U');
      expect(retrap.mass.toString(), '32.5');
      expect(retrap.moult.toString(), 'P');
      expect(retrap.plumageCode.toString(), 'D');
      expect(retrap.hindClaw.toString(), '22.1');
      expect(retrap.billLength.toString(), '30.2');
      expect(retrap.billMethod.toString(), 'S');
      expect(retrap.headLengthTotal.toString(), '43.5');
      expect(retrap.tarsus.toString(), '36.7');
      expect(retrap.tarsusMethod.toString(), 'S');
      expect(retrap.tailLength.toString(), '55.5');
      expect(retrap.tailDifference.toString(), '6.5');
      expect(retrap.fatScore.toString(), '3');
      expect(retrap.fatScoreMethod.toString(), 'E');
      expect(retrap.pectoralMuscle.toString(), '2');
      expect(retrap.broodPatch.toString(), '3');
      expect(retrap.primaryScore.toString(), '55');
      expect(retrap.primaryMoult.toString(), '1');
      expect(retrap.oldGreaterCoverts.toString(), '9');
      expect(retrap.alula.toString(), '0');
      expect(retrap.carpalCovert.toString(), '0');

      final updated = await monRingDb.updateRetrap(
        RetrapEntityCompanion(
          id: d.Value(id),
          sessionId: const d.Value(2),
          ringerId: const d.Value('7000'),
          ringScheme: const d.Value('GBT'),
          primaryIdMethod: const d.Value('C0'),
          ringSeriesCode: const d.Value('E'),
          ringIdNumber: const d.Value('16'),
          metalRingInfo: const d.Value('3'),
          species: const d.Value('MIL.VUS'),
          age: const d.Value('5'),
          sex: const d.Value('U'),
          sexingMethod: const d.Value('A'),
          otherMarks: const d.Value('DC'),
          catchingMethod: const d.Value('C'),
          catchingLures: const d.Value('D'),
          condition: const d.Value('7'),
          circumstances: const d.Value('33'),
          circumstancesPresumed: const d.Value('0'),
          status: const d.Value('L'),
          time: const d.Value('06:55'),
          wingLength: const d.Value('152.2'),
          thirdPrimary: const d.Value('90.5'),
          wingPointState: const d.Value('V'),
          mass: const d.Value('42.5'),
          moult: const d.Value('X'),
          plumageCode: const d.Value('U'),
          hindClaw: const d.Value('32.1'),
          billLength: const d.Value('40.2'),
          billMethod: const d.Value('C'),
          headLengthTotal: const d.Value('53.5'),
          tarsus: const d.Value('46.7'),
          tarsusMethod: const d.Value('T'),
          tailLength: const d.Value('65.5'),
          tailDifference: const d.Value('7.5'),
          fatScore: const d.Value('4'),
          fatScoreMethod: const d.Value('P'),
          pectoralMuscle: const d.Value('3'),
          broodPatch: const d.Value('4'),
          primaryScore: const d.Value('33'),
          primaryMoult: const d.Value('2'),
          oldGreaterCoverts: const d.Value('A'),
          alula: const d.Value('1'),
          carpalCovert: const d.Value('1'),
        ),
      );
      final updatedRetrap = await monRingDb.getRetrap(id);

      expect(updated, true);
      expect(updatedRetrap.sessionId, 2);
      expect(updatedRetrap.ringerId.toString(), '7000');
      expect(updatedRetrap.ringScheme.toString(), 'GBT');
      expect(updatedRetrap.primaryIdMethod.toString(), 'C0');
      expect(updatedRetrap.ringSeriesCode.toString(), 'E');
      expect(updatedRetrap.ringIdNumber.toString(), '16');
      expect(updatedRetrap.metalRingInfo.toString(), '3');
      expect(updatedRetrap.species.toString(), 'MIL.VUS');
      expect(updatedRetrap.age.toString(), '5');
      expect(updatedRetrap.sex.toString(), 'U');
      expect(updatedRetrap.sexingMethod.toString(), 'A');
      expect(updatedRetrap.otherMarks.toString(), 'DC');
      expect(updatedRetrap.catchingMethod.toString(), 'C');
      expect(updatedRetrap.catchingLures.toString(), 'D');
      expect(updatedRetrap.condition.toString(), '7');
      expect(updatedRetrap.circumstances.toString(), '33');
      expect(updatedRetrap.circumstancesPresumed.toString(), '0');
      expect(updatedRetrap.status.toString(), 'L');
      expect(updatedRetrap.time.toString(), '06:55');
      expect(updatedRetrap.wingLength.toString(), '152.2');
      expect(updatedRetrap.thirdPrimary.toString(), '90.5');
      expect(updatedRetrap.wingPointState.toString(), 'V');
      expect(updatedRetrap.mass.toString(), '42.5');
      expect(updatedRetrap.moult.toString(), 'X');
      expect(updatedRetrap.plumageCode.toString(), 'U');
      expect(updatedRetrap.hindClaw.toString(), '32.1');
      expect(updatedRetrap.billLength.toString(), '40.2');
      expect(updatedRetrap.billMethod.toString(), 'C');
      expect(updatedRetrap.headLengthTotal.toString(), '53.5');
      expect(updatedRetrap.tarsus.toString(), '46.7');
      expect(updatedRetrap.tarsusMethod.toString(), 'T');
      expect(updatedRetrap.tailLength.toString(), '65.5');
      expect(updatedRetrap.tailDifference.toString(), '7.5');
      expect(updatedRetrap.fatScore.toString(), '4');
      expect(updatedRetrap.fatScoreMethod.toString(), 'P');
      expect(updatedRetrap.pectoralMuscle.toString(), '3');
      expect(updatedRetrap.broodPatch.toString(), '4');
      expect(updatedRetrap.primaryScore.toString(), '33');
      expect(updatedRetrap.primaryMoult.toString(), '2');
      expect(updatedRetrap.oldGreaterCoverts.toString(), 'A');
      expect(updatedRetrap.alula.toString(), '1');
      expect(updatedRetrap.carpalCovert.toString(), '1');

      final deleted = await monRingDb.deleteRetrap(id);

      expect(deleted, id);
    });

    test('Stream emits list of right retraps.', () async {
      await monRingDb.saveRetrap(mock_data.retraps[0]);
      await monRingDb.saveRetrap(mock_data.retraps[1]);

      final expectation = expectLater(
          monRingDb
              .watchSessionRetraps(2)
              .map((retrapList) => retrapList.length),
          emitsInOrder([1, 2]));

      await monRingDb.saveRetrap(mock_data.retraps[2]);
      await expectation;
    });
  });
}
