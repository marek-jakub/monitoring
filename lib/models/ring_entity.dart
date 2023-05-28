import 'package:drift/drift.dart';

import '../models/models.dart';

/// A model or bird ring.
class RingEntity extends Table {
  // non-nullable
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sessionId => integer().references(SessionEntity, #id)();
  TextColumn get primaryIdMethod => text()();
  TextColumn get ringSeriesCode => text()();
  TextColumn get ringIdNumber => text()();
  TextColumn get metalRingInfo => text()();
  TextColumn get species => text()();
  TextColumn get age => text()();
  TextColumn get sex => text()();

  // can be empty
  TextColumn get sexingMethod => text()();
  TextColumn get otherMarks => text()();
  TextColumn get catchingMethod => text()();
  TextColumn get catchingLures => text()();
  TextColumn get condition => text()();
  TextColumn get circumstances => text()();
  TextColumn get circumstancesPresumed => text()();
  TextColumn get status => text()();
  TextColumn get time => text()();
  TextColumn get wingLength => text()();
  TextColumn get thirdPrimary => text()();
  TextColumn get wingPointState => text()();
  TextColumn get mass => text()();
  TextColumn get moult => text()();
  TextColumn get plumageCode => text()();
  TextColumn get hindClaw => text()();
  TextColumn get billLength => text()();
  TextColumn get billMethod => text()();
  TextColumn get headLengthTotal => text()();
  TextColumn get tarsus => text()();
  TextColumn get tarsusMethod => text()();
  TextColumn get tailLength => text()();
  TextColumn get tailDifference => text()();
  TextColumn get fatScore => text()();
  TextColumn get fatScoreMethod => text()();
  TextColumn get pectoralMuscle => text()();
  TextColumn get broodPatch => text()();
  TextColumn get primaryScore => text()();
  TextColumn get primaryMoult => text()();
  TextColumn get oldGreaterCoverts => text()();
  TextColumn get alula => text()();
  TextColumn get carpalCovert => text()();
}
