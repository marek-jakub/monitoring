import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../models/models.dart';

part 'monitoring_db.g.dart';

// TODO: create table entities
@DriftDatabase(tables: [], views: [])
class MonRingDb extends _$MonRingDb {
  MonRingDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // TODO: define database access methods
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db_a.sqlite'));

    //return NativeDatabase.createInBackground(file);
    return NativeDatabase(file);
  });
}
