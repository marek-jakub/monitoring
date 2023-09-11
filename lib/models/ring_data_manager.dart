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
  List<RingEntityData> _ringerRings = [];

  // Retrap
  bool _newRetrap = false;
  bool _editRetrap = false;
  bool _isRetrapAdded = false;
  bool _isRetrapUpdated = false;
  bool _isRetrapDeleted = false;
  int _selectedRetrapId = -1;
  RetrapEntityData? _retrapEntityData;
  List<RetrapEntityData> _sessionRetrapStream = [];
  List<RetrapEntityData> _ringerRetraps = [];

  // Report
  bool _newReport = false;
  bool _isReportAdded = false;
  List<ReportEntityData> _reportStream = [];

  // RingSeries
  bool _newRingSeries = false;
  bool _isRingSeriesAdded = false;
  bool _isRingSeriesUpdated = false;
  bool _isRingSeriesDeleted = false;
  //int _selectedRingSeriesId = -1;
  List<RingseriesEntityData> _ringSeriesStream = [];

  // Lost ring
  bool _newLostRing = false;
  bool _isLostRingAdded = false;
  bool _isLostRingUpdated = false;
  bool _isLostRingDeleted = false;
  List<LostRingEntityData> _lostRingsStream = [];

  // Ring orders
  bool _makeOrder = false;
  bool _isOrderAdded = false;
  bool _isOrderUpdated = false;
  bool _isOrderDeleted = false;
  List<OrderEntityData> _orderStream = [];

  /// Whether loading data from database takes longer.
  bool _isLoading = false;

  /// Currently chosen country in add session.
  String _country = '';

  /// Holding error message if occuring during database access.
  String _error = '';

  /// A value of currently chosen country when adding a session.
  ///
  /// Used to pick values of place code for the given country.
  String get country => _country;
  void setCountry(String value) {
    _country = value;
    notifyListeners();
  }

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

  /// Access to a ringer rings in the database.
  List<RingEntityData> get ringerRings => _ringerRings;

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

  /// An id of selected retrap.
  int get selectedRetrapId => _selectedRetrapId;
  void setSelectedRetrapId(int id) {
    _selectedRetrapId = id;
    //notifyListeners();
  }

  /// Access to a ringer retraps in the database.
  List<RetrapEntityData> get ringerRetraps => _ringerRetraps;

  /// Access to a retrap information.
  RetrapEntityData? get retrapEntityData => _retrapEntityData;

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

  /// Whether report data has been successfuly saved in the database.
  bool get isReportAdded => _isReportAdded;
  void setIsReportAdded(bool added) {
    _isReportAdded = added;
    notifyListeners();
  }

  /// Access to report stream list of a given ringer.
  List<ReportEntityData> get reportStream => _reportStream;

  // RINGSERIES /////////////////////////

  /// Access to add ring series screen.
  ///
  /// True for entering add ring series screen, false for pop page.
  bool get newRingSeries => _newRingSeries;
  void setNewRingSeries(bool create) {
    _newRingSeries = create;
    notifyListeners();
  }

  /// Whether ring series data has been successfuly saved in the database.
  bool get isRingSeriesAdded => _isRingSeriesAdded;
  void setIsRingSeriesAdded(bool added) {
    _isRingSeriesAdded = added;
    notifyListeners();
  }

  /// Whether ring series data has been successfuly updated in the database.
  bool get isRingSeriesUpdated => _isRingSeriesUpdated;
  void setIsRingSeriesUpdated(bool updated) {
    _isRingSeriesUpdated = updated;
    notifyListeners();
  }

  /// Whether ring series data has been successfuly deleted from the database.
  bool get isRingSeriesDeleted => _isRingSeriesDeleted;
  void setIsRingSeriesDeleted(bool deleted) {
    _isRingSeriesDeleted = deleted;
    notifyListeners();
  }

  /// An id of selected ring series.
  // int get selectedRingSeriesId => _selectedRingSeriesId;
  // void setSelectedRingSeriesId(int id) {
  //   _selectedRingSeriesId = id;
  //   //notifyListeners();
  // }

  /// Access to ring series stream list of a given ringer.
  List<RingseriesEntityData> get ringSeriesStream => _ringSeriesStream;

  // LOST RING ///////////////////////////

  /// Access to add lost ring screen.
  ///
  /// True for entering add lost ring screen, false for pop page.
  bool get newLostRing => _newLostRing;
  void setNewLostRing(bool create) {
    _newLostRing = create;
    notifyListeners();
  }

  /// Whether lost ring data has been successfuly saved in the database.
  bool get isLostRingAdded => _isLostRingAdded;
  void setIsLostRingAdded(bool added) {
    _isLostRingAdded = added;
    notifyListeners();
  }

  /// Whether lost ring data has been successfuly updated in the database.
  bool get isLostRingUpdated => _isLostRingUpdated;
  void setIsLostRingUpdated(bool updated) {
    _isLostRingUpdated = updated;
    notifyListeners();
  }

  /// Whether lost ring data has been successfuly deleted from the database.
  bool get isLostRingDeleted => _isLostRingDeleted;
  void setIsLostRingDeleted(bool deleted) {
    _isLostRingDeleted = deleted;
    notifyListeners();
  }

  /// Access to lost rings stream list of a given ringer.
  List<LostRingEntityData> get lostRingsStream => _lostRingsStream;

  // ORDER ///////////////////////////////

  /// Access to orders screen.
  ///
  /// True for entering the make order screen, false for pop page.
  bool get makeOrder => _makeOrder;
  void setMakeOrder(bool create) {
    _makeOrder = create;
    notifyListeners();
  }

  /// Whether order data has been successfuly saved in the database.
  bool get isOrderAdded => _isOrderAdded;
  void setIsOrderAdded(bool added) {
    _isOrderAdded = added;
    notifyListeners();
  }

  /// Whether order data has been successfuly updated in the database.
  bool get isOrderUpdated => _isOrderUpdated;
  void setIsOrderUpdated(bool updated) {
    _isOrderUpdated = updated;
    notifyListeners();
  }

  /// Whether order data has been successfuly deleted from the database.
  bool get isOrderDeleted => _isOrderDeleted;
  void setIsOrderDeleted(bool deleted) {
    _isOrderDeleted = deleted;
    notifyListeners();
  }

  /// Access to order stream list of a given ringer.
  List<OrderEntityData> get orderStream => _orderStream;

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
      // debugPrint('=========================================');
      // debugPrint('SESSION-LOCATION VIEW BY ID: ');
      // debugPrint('session manager calling session location $value');
      // debugPrint('=========================================');
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
      // debugPrint('=========================================');
      // debugPrint('SESSION RINGS STREAM SIZE: ${event.length}');
      // debugPrint('session manager calling session rings: $event');
      // debugPrint('=========================================');
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

  /// Fetches ringer rings data from the database.
  void fetchRingerRings(String ringerId) {
    _monRingDb?.getRingerRings(ringerId).then((value) {
      _ringerRings = value;
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

  /// Fetches ringer retraps data from the database.
  void fetchRingerRetraps(String ringerId) {
    _monRingDb?.getRingerRetraps(ringerId).then((value) {
      _ringerRetraps = value;
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

  /// Deletes retrap information from the database.
  ///
  /// Id of the retrap to be deleted is stored in the [_selectedRetrapId].
  void deleteRetrap() {
    _monRingDb?.deleteRetrap(selectedRetrapId).then((value) {
      if (value == 0) {
        _error = 'Record not found';
      } else {
        _isRetrapDeleted = true;
        setSelectedRetrapId(-1);
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Fetches retrap information from the database, identified by retrap [id].
  void getRetrapById(int id) {
    _monRingDb?.getRetrap(id).then((value) {
      _retrapEntityData = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Saves ring series entity [companion] data in the database.
  void saveRingSeries(RingseriesEntityCompanion companion) {
    _monRingDb?.saveRingSeries(companion).then((value) {
      _isRingSeriesAdded = value > 0 ? true : false;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Updates ring series information as given in the [companion].
  void updateRingSeries(RingseriesEntityCompanion companion) {
    _monRingDb?.updateRingSeries(companion).then((value) {
      _isRingSeriesUpdated = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Deletes ring series information from the database.
  ///
  /// Id of the ring series to be deleted is stored in the [id].
  void deleteRingSeries(int id) {
    _monRingDb?.deleteRingSeries(id).then((value) {
      if (value == 0) {
        _error = 'Record not found';
      } else {
        _isRingSeriesDeleted = true;
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// A stream of ring series for a ringer identified by [id].
  void getRingSeriesStream(String id) {
    _isLoading = true;

    _monRingDb?.watchRingSeries(id).listen((event) {
      _ringSeriesStream = event;
      _isLoading = false;
      notifyListeners();
    });
  }

  /// Saves lost ring entity [companion] data in the database.
  void saveLostRing(LostRingEntityCompanion companion) {
    _monRingDb?.saveLostRing(companion).then((value) {
      _isLostRingAdded = value > 0 ? true : false;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Updates lost ring information as given in the [companion].
  void updateLostRing(LostRingEntityCompanion companion) {
    _monRingDb?.updateLostRing(companion).then((value) {
      _isLostRingUpdated = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Deletes lost ring information from the database.
  ///
  /// Id of the lost ring to be deleted is stored in the [id].
  void deleteLostRing(int id) {
    _monRingDb?.deleteLostRing(id).then((value) {
      if (value == 0) {
        _error = 'Record not found';
      } else {
        _isLostRingDeleted = true;
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// A stream of lost rings for a ringer identified by [id].
  void getLostRingsStream(String id) {
    _isLoading = true;

    _monRingDb?.watchLostRings(id).listen((event) {
      _lostRingsStream = event;
      _isLoading = false;
      notifyListeners();
    });
  }

  /// Saves order entity [companion] data in the database.
  void saveOrder(OrderEntityCompanion companion) {
    _monRingDb?.saveOrder(companion).then((value) {
      _isOrderAdded = value > 0 ? true : false;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Updates order information as given in the [companion].
  void updateOrder(OrderEntityCompanion companion) {
    _monRingDb?.updateOrder(companion).then((value) {
      _isOrderUpdated = value;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// Deletes order information from the database.
  ///
  /// Id of the order to be deleted is stored in the [id].
  void deleteOrder(int id) {
    _monRingDb?.deleteOrder(id).then((value) {
      if (value == 0) {
        _error = 'Record not found';
      } else {
        _isOrderDeleted = true;
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// A stream of lost rings for a ringer identified by [id].
  void getOrderStream(String id) {
    _isLoading = true;

    _monRingDb?.watchOrders(id).listen((event) {
      _orderStream = event;
      _isLoading = false;
      notifyListeners();
    });
  }

  /// Saves report entity [companion] data in the database.
  void saveReport(ReportEntityCompanion companion) {
    _monRingDb?.saveReport(companion).then((value) {
      _isReportAdded = value > 0 ? true : false;
      notifyListeners();
    }).onError((error, stackTrace) {
      _error = error.toString();
      notifyListeners();
    });
  }

  /// A stream of lost rings for a ringer identified by [id].
  void getReportStream(String id) {
    _isLoading = true;

    _monRingDb?.watchReports(id).listen((event) {
      _reportStream = event;
      _isLoading = false;
      notifyListeners();
    });
  }
}
