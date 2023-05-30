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
  // Session
  bool _newSession = false;
  List<SessionLocationViewData> _sessionLocationViewStream = [];

  // Location

  // Ring
  bool _newRing = false;

  // Retrap

  // Report
  bool _newReport = false;

  // RingSeries

  // Lost ring

  // Ring orders

  ///////////////////// SESSION /////////////////////////////
  /// The access to add session screen.
  ///
  /// True for accessing add_session screen, false for pop page.
  bool get newSession => _newSession;
  void setNewSession(bool create) {
    _newSession = create;
    notifyListeners();
  }

  /// Access to session - location combined view.
  ///
  /// A stream of list of joined tables session and location.
  List<SessionLocationViewData> get sessionLocationViewStream =>
      _sessionLocationViewStream;

  ///////////////////// RING ////////////////////////////////
  /// The access to add ring screen.
  ///
  /// True for accessing add_ring screen, false for pop page.
  bool get newRing => _newRing;
  void setNewRing(bool create) {
    _newRing = create;
    notifyListeners();
  }

  ///////////////////// REPORT /////////////////////////////
  /// The access to create report screen.
  ///
  /// True for accessing report screen, false for pop page.
  bool get newReport => _newReport;
  void setNewReport(bool create) {
    _newReport = create;
    notifyListeners();
  }
}
