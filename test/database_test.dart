import 'package:drift/native.dart';
import 'package:test/test.dart';
import 'package:drift/drift.dart' as d;

import 'package:monitoring/data/monitoring_db.dart';

import 'database_test_data.dart';

void main() {
  late MonRingDb monRingDb;

  setUp(() {
    monRingDb = MonRingDb(NativeDatabase.memory());
  });

  tearDown(() {
    monRingDb.close();
  });

  group('Session data can be saved, updated and retrieved.', () {
    test('Session can be saved.', () async {
      final id = await monRingDb.saveSession(sessions[0]);
      final session = await monRingDb.getSession(id);

      expect(session.id, id);
      expect(session.date.toString(), '06-06-2023');
      expect(session.dateAccuracy.toString(), '0');
      expect(session.location, 1);
      expect(session.ringerId.toString(), '6000');
      expect(session.startTime.toString(), '04:00');
      expect(session.endTime.toString(), '10:00');
    });

    test('Another session can be saved and updated.', () async {
      final id = await monRingDb.saveSession(sessions[1]);
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
          location: const d.Value(3),
          ringerId: const d.Value('8000'),
          startTime: const d.Value('06:00'),
          endTime: const d.Value('12:00'),
        ),
      );
      final updatedSession = await monRingDb.getSession(id);

      expect(updated, true);
      expect(updatedSession.date.toString(), '08-06-2023');
      expect(updatedSession.dateAccuracy.toString(), '2');
      expect(updatedSession.location, 3);
      expect(updatedSession.ringerId.toString(), '8000');
      expect(updatedSession.startTime.toString(), '06:00');
      expect(updatedSession.endTime.toString(), '12:00');
    });
  });

  group('Location data can be saved, updated and retrieved.', () {
    test('Location can be saved.', () async {
      final id = await monRingDb.saveLocation(locations[0]);
      final location = await monRingDb.getLocationById(id);

      expect(location.id, id);
      expect(location.locality.toString(), 'London');
      expect(location.placeCode.toString(), 'GB');
      expect(location.latitude.toString(), '49.00');
      expect(location.longitude.toString(), '0.012');
      expect(location.coordinatesAccuracy.toString(), '0');
      expect(location.localeInfo.toString(), 'Nature reserve Thames');
    });

    test('Another location can be saved and updated.', () async {
      final id = await monRingDb.saveLocation(locations[1]);
      final location = await monRingDb.getLocationById(id);

      expect(location.id, id);
      expect(location.locality.toString(), 'Paris');
      expect(location.placeCode.toString(), 'FR');
      expect(location.latitude.toString(), '41.00');
      expect(location.longitude.toString(), '7.012');
      expect(location.coordinatesAccuracy.toString(), '1');
      expect(location.localeInfo.toString(), 'Blue Forest');

      final updated = await monRingDb.updateLocation(
        LocationEntityCompanion(
          id: d.Value(id),
          locality: const d.Value('Rome'),
          placeCode: const d.Value('ITA'),
          latitude: const d.Value('36.00'),
          longitude: const d.Value('19.25'),
          coordinatesAccuracy: const d.Value('2'),
          localeInfo: const d.Value('Dulle terraces'),
        ),
      );
      final updatedLocation = await monRingDb.getLocationById(id);

      expect(updated, true);
      expect(updatedLocation.locality.toString(), 'Rome');
      expect(updatedLocation.placeCode.toString(), 'ITA');
      expect(updatedLocation.latitude, '36.00');
      expect(updatedLocation.longitude.toString(), '19.25');
      expect(updatedLocation.coordinatesAccuracy.toString(), '2');
      expect(updatedLocation.localeInfo.toString(), 'Dulle terraces');
    });
  });

  group('Ring data can be saved, updated and retrieved.', () {});
}
