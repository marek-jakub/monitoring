import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:monitoring/data/monitoring_db.dart';
import 'package:drift/drift.dart' as d;

/// Notifier for ringing data and database access.
///
/// Allows main management of ringing data - sessions, rings and retraps.
class RingDataManager extends ChangeNotifier {
  /// App database
  MonRingDb? _monRingDb;

  void initDb(MonRingDb db) {
    _monRingDb = db;
  }

  // PRIVATE MEMBERS /////////////////////
  // Session
  bool _newSession = false;
  bool _sessionTapped = false;
  bool _isSessionAdded = false;

  // Location

  // Session-location view
  List<SessionLocationViewData> _sessionLocationViewStream = [];
  SessionLocationViewData? _sessionLocationViewData;

  // Ring
  bool _newRing = false;
  List<RingEntityData> _sessionRingStream = [];

  // Retrap

  // Report
  bool _newReport = false;

  // RingSeries

  // Lost ring

  // Ring orders

  /// Whether loading data from database takes longer.
  bool _isLoading = false;

  /// Holding error message if occuring during database access.
  String _error = '';

  /// A value signifying busy database.
  ///
  /// If true, show circular loading indicator.
  bool get isLoading => _isLoading;

  /// A value holding any error message if occuring on database access.
  String get error => _error;
  void setError(String value) {
    _error = value;
    notifyListeners();
  }

  // SESSION /////////////////////////////

  /// The access to add session screen.
  ///
  /// True for accessing add_session screen, false for pop page.
  bool get newSession => _newSession;
  void setNewSession(bool create) {
    _newSession = create;
    notifyListeners();
  }

  /// Access to session tapped value.
  ///
  /// True on session tap, else false.
  bool get sessionTapped => _sessionTapped;
  void setSessionTapped(bool value) {
    _sessionTapped = value;
    notifyListeners();
  }

  /// Whether the session has been succesfully saved in the database.
  bool get isSessionAdded => _isSessionAdded;
  void setIsSessionAdded(bool value) {
    _isSessionAdded = value;
    notifyListeners();
  }

  /// Access to session-location combined view.
  ///
  /// A stream of list of joined tables session and location.
  List<SessionLocationViewData> get sessionLocationViewStream =>
      _sessionLocationViewStream;

  // RING ////////////////////////////////

  /// The access to add ring screen.
  ///
  /// True for accessing add_ring screen, false for pop page.
  bool get newRing => _newRing;
  void setNewRing(bool create) {
    _newRing = create;
    notifyListeners();
  }

  /// Access to ring stream list of a given session.
  ///
  /// ...
  List<RingEntityData> get sessionRingStream => _sessionRingStream;

  // REPORT /////////////////////////////

  /// The access to create report screen.
  ///
  /// True for accessing report screen, false for pop page.
  bool get newReport => _newReport;
  void setNewReport(bool create) {
    _newReport = create;
    notifyListeners();
  }

  // DATABASE ACCESS /////////////////////

  /// A stream of session-location view.
  void getSessionLocationViewStream() {
    _isLoading = true;

    _monRingDb?.watchSessionLocationView().listen((event) {
      _sessionLocationViewStream = event;
      debugPrint('=========================================');
      debugPrint('SESSION-LOCATION VIEW STREAM SIZE: ${event.length}');
      debugPrint('session manager calling location view: $event');
      debugPrint('=========================================');
      _isLoading = false;
      notifyListeners();
    });
  }

  void getSessionLocationById(int id) {
    _isLoading = true;

    _monRingDb?.getSessionLocationById(id).then((value) {
      _sessionLocationViewData = value;
      _isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      _isLoading = false;
      notifyListeners();
    });
  }

  /// A stream of rings of a session with identifier [id].
  void getSessionRingStream(int id) {
    _isLoading = true;

    _monRingDb?.watchSessionRings(id).listen((event) {
      _sessionRingStream = event;
      debugPrint('=========================================');
      debugPrint('SESSION RINGS STREAM SIZE: ${event.length}');
      debugPrint('session manager calling session rings: $event');
      debugPrint('=========================================');
      _isLoading = false;
      notifyListeners();
    });
  }

  /// Saving location [locCompanion] in the database, if successful using
  /// returned location's id to save session [sesCompanion].
  void saveSession(LocationEntityCompanion locCompanion,
      SessionEntityCompanion sesCompanion) {
    _monRingDb?.saveLocation(locCompanion).then((value) {
      if (value > 0) {
        final sessionEntity = SessionEntityCompanion(
          date: sesCompanion.date,
          dateAccuracy: sesCompanion.dateAccuracy,
          location: d.Value(value),
          ringerId: sesCompanion.ringerId,
          startTime: sesCompanion.startTime,
          endTime: sesCompanion.endTime,
        );
        _monRingDb?.saveSession(sessionEntity).then((val) {
          _isSessionAdded = val > 0 ? true : false;
          notifyListeners();
        }).onError((error, stackTrace) {
          _error = error.toString();
          notifyListeners();
        });
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }
}
