import 'package:drift/drift.dart' as d;
import 'package:monitoring/data/monitoring_db.dart';

/// Test data for database in the form of table entity companions.
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
