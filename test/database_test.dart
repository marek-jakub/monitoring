import 'package:drift/native.dart';
import 'package:test/test.dart';

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

  group('Session data can be saved and retrieved.', () {
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

    test('Another session can be saved.', () async {
      final id = await monRingDb.saveSession(sessions[1]);
      final session = await monRingDb.getSession(id);

      expect(session.id, id);
      expect(session.date.toString(), '07-06-2023');
      expect(session.dateAccuracy.toString(), '1');
      expect(session.location, 2);
      expect(session.ringerId.toString(), '7000');
      expect(session.startTime.toString(), '05:00');
      expect(session.endTime.toString(), '11:00');
    });
  });
}
