import 'package:drift/native.dart';
import 'package:test/test.dart';
import 'package:drift/drift.dart' as d;

import 'package:monitoring/data/monitoring_db.dart';

import 'database_mock_data.dart' as test_data;

void main() {
  late MonRingDb monRingDb;

  setUp(() {
    // On testing uncomment below and comment out initializer with no parameters.
    monRingDb = MonRingDb(NativeDatabase.memory());
    //monRingDb = MonRingDb();

    // Load mock data
  });

  tearDown(() {
    monRingDb.close();
  });

  // TODO: implement widget tests
}
