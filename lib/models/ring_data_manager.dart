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

  // PRIVATE MEMBERS /////////////////////
  // Session
  bool _newSession = false;
  bool _sessionTapped = false;
  bool _isSessionAdded = false;
  List<SessionLocationViewData> _sessionLocationViewStream = [];

  // Location

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

  /// Access to session-location combined view.
  ///
  /// A stream of list of joined tables session and location.
  List<SessionLocationViewData> get sessionLocationViewStream =>
      _sessionLocationViewStream;

  /// Whether the session has been succesfully saved in the database.
  bool get isSessionAdded => _isSessionAdded;
  void setIsSessionAdded(bool value) {
    _isSessionAdded = value;
    notifyListeners();
  }

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

    // _appdb?.watchAllSessions().listen((event) {
    //   debugPrint('SESSIONS STREAM SIZE: ${event.length}');
    //   debugPrint('session manager calling sessions: $event');
    //   debugPrint('=========================================');
    // });

    // _appdb?.watchAllLocations().listen((event) {
    //   debugPrint('LOCATIONS STREAM SIZE: ${event.length}');
    //   debugPrint('session manager calling locations: $event');
    //   debugPrint('=========================================');
    // });
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
}
