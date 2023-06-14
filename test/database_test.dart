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
    // Session id to be used when updating session data.
    int id = -1;

    test('Session can be saved.', () async {
      id = await monRingDb.saveSession(sessions[0]);
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
      id = await monRingDb.saveSession(sessions[1]);
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
}
