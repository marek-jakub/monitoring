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

List<LocationEntityCompanion> locations = [
  const LocationEntityCompanion(
    locality: d.Value('London'),
    placeCode: d.Value('GB'),
    latitude: d.Value('49.00'),
    longitude: d.Value('0.012'),
    coordinatesAccuracy: d.Value('0'),
    localeInfo: d.Value('Nature reserve Thames'),
  ),
  const LocationEntityCompanion(
    locality: d.Value('Paris'),
    placeCode: d.Value('FR'),
    latitude: d.Value('41.00'),
    longitude: d.Value('7.012'),
    coordinatesAccuracy: d.Value('1'),
    localeInfo: d.Value('Blue Forest'),
  ),
];

List<RingEntityCompanion> rings = [
  const RingEntityCompanion(
    sessionId: d.Value(1),
    primaryIdMethod: d.Value('A0'),
    ringSeriesCode: d.Value('C'),
    ringIdNumber: d.Value('12'),
    metalRingInfo: d.Value('1'),
    species: d.Value('SYLATR'),
    age: d.Value('3'),
    sex: d.Value('F'),
    sexingMethod: d.Value('S'),
    otherMarks: d.Value('ZZ'),
    catchingMethod: d.Value('M'),
    catchingLures: d.Value('N'),
    condition: d.Value('8'),
    circumstances: d.Value('61'),
    circumstancesPresumed: d.Value('0'),
    status: d.Value('U'),
    time: d.Value('04:55'),
    wingLength: d.Value('122.2'),
    thirdPrimary: d.Value('70.5'),
    wingPointState: d.Value('A'),
    mass: d.Value('22.5'),
    moult: d.Value('M'),
    plumageCode: d.Value('A'),
    hindClaw: d.Value('12.1'),
    billLength: d.Value('20.2'),
    billMethod: d.Value('N'),
    headLengthTotal: d.Value('33.5'),
    tarsus: d.Value('26.7'),
    tarsusMethod: d.Value('M'),
    tailLength: d.Value('45.5'),
    tailDifference: d.Value('5.5'),
    fatScore: d.Value('2'),
    fatScoreMethod: d.Value('B'),
    pectoralMuscle: d.Value('1'),
    broodPatch: d.Value('2'),
    primaryScore: d.Value('45'),
    primaryMoult: d.Value('0'),
    oldGreaterCoverts: d.Value('A'),
    alula: d.Value('1'),
    carpalCovert: d.Value('1'),
  ),
  const RingEntityCompanion(
    sessionId: d.Value(2),
    primaryIdMethod: d.Value('B0'),
    ringSeriesCode: d.Value('D'),
    ringIdNumber: d.Value('14'),
    metalRingInfo: d.Value('2'),
    species: d.Value('EMBLLA'),
    age: d.Value('4'),
    sex: d.Value('M'),
    sexingMethod: d.Value('U'),
    otherMarks: d.Value('BB'),
    catchingMethod: d.Value('A'),
    catchingLures: d.Value('F'),
    condition: d.Value('6'),
    circumstances: d.Value('44'),
    circumstancesPresumed: d.Value('1'),
    status: d.Value('N'),
    time: d.Value('05:55'),
    wingLength: d.Value('142.2'),
    thirdPrimary: d.Value('80.5'),
    wingPointState: d.Value('U'),
    mass: d.Value('32.5'),
    moult: d.Value('P'),
    plumageCode: d.Value('D'),
    hindClaw: d.Value('22.1'),
    billLength: d.Value('30.2'),
    billMethod: d.Value('S'),
    headLengthTotal: d.Value('43.5'),
    tarsus: d.Value('36.7'),
    tarsusMethod: d.Value('S'),
    tailLength: d.Value('55.5'),
    tailDifference: d.Value('6.5'),
    fatScore: d.Value('3'),
    fatScoreMethod: d.Value('E'),
    pectoralMuscle: d.Value('2'),
    broodPatch: d.Value('3'),
    primaryScore: d.Value('55'),
    primaryMoult: d.Value('1'),
    oldGreaterCoverts: d.Value('9'),
    alula: d.Value('0'),
    carpalCovert: d.Value('0'),
  ),
];

List<RetrapEntityCompanion> retraps = [
  const RetrapEntityCompanion(
    sessionId: d.Value(1),
    ringScheme: d.Value('GBL'),
    primaryIdMethod: d.Value('A0'),
    ringSeriesCode: d.Value('C'),
    ringIdNumber: d.Value('12'),
    metalRingInfo: d.Value('1'),
    species: d.Value('SYLATR'),
    age: d.Value('3'),
    sex: d.Value('F'),
    sexingMethod: d.Value('S'),
    otherMarks: d.Value('ZZ'),
    catchingMethod: d.Value('M'),
    catchingLures: d.Value('N'),
    condition: d.Value('8'),
    circumstances: d.Value('61'),
    circumstancesPresumed: d.Value('0'),
    status: d.Value('U'),
    time: d.Value('04:55'),
    wingLength: d.Value('122.2'),
    thirdPrimary: d.Value('70.5'),
    wingPointState: d.Value('A'),
    mass: d.Value('22.5'),
    moult: d.Value('M'),
    plumageCode: d.Value('A'),
    hindClaw: d.Value('12.1'),
    billLength: d.Value('20.2'),
    billMethod: d.Value('N'),
    headLengthTotal: d.Value('33.5'),
    tarsus: d.Value('26.7'),
    tarsusMethod: d.Value('M'),
    tailLength: d.Value('45.5'),
    tailDifference: d.Value('5.5'),
    fatScore: d.Value('2'),
    fatScoreMethod: d.Value('B'),
    pectoralMuscle: d.Value('1'),
    broodPatch: d.Value('2'),
    primaryScore: d.Value('45'),
    primaryMoult: d.Value('0'),
    oldGreaterCoverts: d.Value('A'),
    alula: d.Value('1'),
    carpalCovert: d.Value('1'),
  ),
];
