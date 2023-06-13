import 'package:drift/native.dart';
import 'package:test/test.dart';
import 'package:drift/drift.dart' as d;

import 'package:monitoring/data/monitoring_db.dart';

List<SessionEntityCompanion> sessions = [
  const SessionEntityCompanion(
    date: d.Value('06-06-2023'),
    dateAccuracy: d.Value('0'),
    location: d.Value(1),
    ringerId: d.Value('6000'),
    startTime: d.Value('04:00'),
    endTime: d.Value('10:00'),
  ),
  const SessionEntityCompanion(
    date: d.Value('07-06-2023'),
    dateAccuracy: d.Value('1'),
    location: d.Value(2),
    ringerId: d.Value('7000'),
    startTime: d.Value('05:00'),
    endTime: d.Value('11:00'),
  ),
];

void main() {
  late MonRingDb monRingDb;

  setUp(() {
    monRingDb = MonRingDb(NativeDatabase.memory());
  });

  tearDown(() {
    monRingDb.close();
  });

  test('session can be created', () async {
    final id = await monRingDb.saveSession(sessions[0]);
    final session = await monRingDb.getSession(id);

    expect(session.id, id);
    expect(session.date.toString(), '06-06-2023');
  });
}
