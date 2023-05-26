import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:monitoring/data/monitoring_db.dart';

/// Notifier for ringing data and database access.
///
/// Allows main management of ringing data - sessions, rings and retraps.
class RingDataManager extends ChangeNotifier {
  /// App database
  MonRingDb? _monRingDb;

  void initDb(MonRingDb db) {
    _monRingDb = db;
  }

  ///////////////////// PRIVATE MEMBERS /////////////////////
  bool _newSession = false;

  ///////////////////// SESSION /////////////////////////////
  /// The access to add session screen.
  ///
  /// True for accessing add_session screen, false for pop page.
  bool get newSession => _newSession;
  void setNewSession(bool create) {
    _newSession = create;
    notifyListeners();
  }
}
