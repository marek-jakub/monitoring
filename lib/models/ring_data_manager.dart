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
  bool _isSessionUpdated = false;
  bool _isSessionDeleted = false;
  bool _editSession = false;
  int _currentSessionId = -1;

  // Location
  bool _isLocationUpdated = false;
  int _currentLocationId = -1;

  // Session-location view
  List<SessionLocationViewData> _sessionLocationViewStream = [];
  SessionLocationViewData? _sessionLocationViewData;

  // Ring
  bool _newRing = false;
  bool _editRing = false;
  bool _isRingAdded = false;
  bool _isRingUpdated = false;
  bool _isRingDeleted = false;
  int _selectedRingId = -1;
  RingEntityData? _ringEntityData;
  List<RingEntityData> _sessionRingStream = [];

  // Retrap
  bool _newRetrap = false;
  bool _editRetrap = false;
  bool _isRetrapAdded = false;
  bool _isRetrapUpdated = false;
  bool _isRetrapDeleted = false;
  List<RetrapEntityData> _sessionRetrapStream = [];

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

  /// Whether selected session has been successfully updated in the database.
  bool get isSessionUpdated => _isSessionUpdated;
  void setIsSessionUpdated(bool value) {
    _isSessionUpdated = value;
    notifyListeners();
  }

  /// Whether the session data is to be edited.
  bool get editSession => _editSession;
  void setEditSession(bool selected) {
    _editSession = selected;
    notifyListeners();
  }

  /// Whether the selected session has been removed form the database.
  bool get isSessionDeleted => _isSessionDeleted;
  void setIsSessionDeleted(bool value) {
    _isSessionDeleted = value;
    notifyListeners();
  }

  /// An id of selected session.
  int get currentSessionId => _currentSessionId;
  void setCurrentSessionId(int id) {
    _currentSessionId = id;
    notifyListeners();
  }

  // LOCATION ///////////////////////////

  /// An id of selected location.
  int get currentLocationId => _currentLocationId;
  void setCurrentLocationId(int id) {
    _currentLocationId = id;
    notifyListeners();
  }

  /// Whether selected location has been successfully updated in the database.
  bool get isLocationUpdated => _isLocationUpdated;
  void setIsLocationUpdated(bool value) {
    _isLocationUpdated = value;
    notifyListeners();
  }

  // SESSION-LOCATION VIEW //////////////

  /// Access to session-location combined view.
  ///
  /// A stream of list of joined tables session and location.
  List<SessionLocationViewData> get sessionLocationViewStream =>
      _sessionLocationViewStream;

  /// Access to session-location view entry.
  ///
  /// An entry of joined tables session and location.
  SessionLocationViewData? get sessionLocationViewData =>
      _sessionLocationViewData;

  // RING ////////////////////////////////

  /// The access to add ring screen.
  ///
  /// True for accessing add_ring screen, false for pop page.
  bool get newRing => _newRing;
  void setNewRing(bool create) {
    _newRing = create;
    notifyListeners();
  }

  /// Access to edit ring screen.
  ///
  /// True for entering edit ring screen, false for pop page.
  bool get editRing => _editRing;
  void setEditRing(bool selected) {
    _editRing = selected;
    notifyListeners();
  }

  /// Whether a new ring has been successfully saved in the database.
  bool get isRingAdded => _isRingAdded;
  void setIsRingAdded(bool create) {
    _isRingAdded = create;
    notifyListeners();
  }

  /// Whether a selected ring has been successfuly updated.
  bool get isRingUpdated => _isRingUpdated;
  void setIsRingUpdated(bool updated) {
    _isRingUpdated = updated;
    notifyListeners();
  }

  /// Whether a selected ring has been successfuly deleted.
  bool get isRingDeleted => _isRingDeleted;
  void setIsRingDeleted(bool deleted) {
    _isRingDeleted = deleted;
    notifyListeners();
  }

  /// An id of selected ring.
  int get selectedRingId => _selectedRingId;
  void setSelectedRingId(int id) {
    _selectedRingId = id;
    notifyListeners();
  }

  /// Access to ring stream list of a given session.
  ///
  /// Session is identified by [_currentSessionId].
  List<RingEntityData> get sessionRingStream => _sessionRingStream;

  /// Access to a ring information.
  RingEntityData? get ringEntityData => _ringEntityData;

  // RETRAP /////////////////////////////

  /// Access to add retrap screen.
  ///
  /// True for entering add retrap screen, false for pop page.
  bool get newRetrap => _newRetrap;
  void setNewRetrap(bool create) {
    _newRetrap = create;
    notifyListeners();
  }

  /// Access to edit retrap screen.
  ///
  /// True for entering edit retrap screen, false for pop page.
  bool get editRetrap => _editRetrap;
  void setEditRetrap(bool selected) {
    _editRetrap = selected;
    notifyListeners();
  }

  /// Whether retrap data has been successfuly saved in the database.
  bool get isRetrapAdded => _isRetrapAdded;
  void setIsRetrapAdded(bool added) {
    _isRetrapAdded = added;
    notifyListeners();
  }

  /// Whether a selected retrap has been successfuly updated.
  bool get isRetrapUpdated => _isRetrapUpdated;
  void setIsRetrapUpdated(bool updated) {
    _isRetrapUpdated = updated;
    notifyListeners();
  }

  /// Whether a selected retrap has been successfuly deleted.
  bool get isRetrapDeleted => _isRetrapDeleted;
  void setIsRetrapDeleted(bool deleted) {
    _isRetrapDeleted = deleted;
    notifyListeners();
  }

  /// Access to retrap stream list of a given session.
  ///
  /// Session is identified by [_currentSessionId].
  List<RetrapEntityData> get sessionRetrapStream => _sessionRetrapStream;

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

  /// Fetches an entry from session-location view, given by [id].
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

  /// A stream of retraps of a session identified by [id].
  void getSessionRetrapStream(int id) {
    _isLoading = true;

    _monRingDb?.watchSessionRetraps(id).listen((event) {
      _sessionRetrapStream = event;
      _isLoading = false;
      notifyListeners();
    });
  }

  /// Saves location [locCompanion] in the database, if successful using
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

  /// Updates session information as given in the [companion].
  void updateSession(SessionEntityCompanion companion) {
    _monRingDb?.updateSession(companion).then((value) {
      _isSessionUpdated = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Updates location information as given in the [companion].
  void updateLocation(LocationEntityCompanion companion) {
    _monRingDb?.updateLocation(companion).then((value) {
      _isLocationUpdated = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Deletes session information from the database.
  ///
  /// Id of the session to be deleted is stored in the [_currentSessionId].
  void deleteSession() {
    _monRingDb?.deleteSession(_currentSessionId).then((value) {
      if (value == 0) {
        _error = 'Record not found';
      } else {
        _isSessionDeleted = true;
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Saves ring entity [companion] data in the database.
  void saveRing(RingEntityCompanion companion) {
    _monRingDb?.saveRing(companion).then((value) {
      _isRingAdded = value > 0 ? true : false;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Fetches ring information from the database, identified by ring [id].
  void getRingById(int id) {
    _monRingDb?.getRing(id).then((value) {
      _ringEntityData = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Updates ring information as given in the [companion].
  ///
  /// Id of the ring to be updated is stored in the [_selectedRingId].
  void updateRing(RingEntityCompanion companion) {
    _monRingDb?.updateRing(companion).then((value) {
      _isRingUpdated = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Deletes ring information from the database.
  ///
  /// Id of the ring to be deleted is stored in the [_selectedRingId].
  void deleteRing() {
    _monRingDb?.deleteRing(selectedRingId).then((value) {
      if (value == 0) {
        _error = 'Record not found';
      } else {
        _isRingDeleted = true;
        setSelectedRingId(-1);
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Saves retrap entity [companion] data in the database.
  void saveRetrap(RetrapEntityCompanion companion) {
    _monRingDb?.saveRetrap(companion).then((value) {
      _isRetrapAdded = value > 0 ? true : false;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Updated retrap entity [companion] in the database.
  void updateRetrap(RetrapEntityCompanion companion) {
    _monRingDb?.updateRetrap(companion).then((value) {
      _isRetrapUpdated = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }
}
