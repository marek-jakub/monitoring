import 'package:flutter/material.dart';

import 'models.dart';

/// Notifier and manager of ringer's profile.
///
/// Currently holds mock data.
class ProfileManager extends ChangeNotifier {
  Ringer get getRinger => Ringer(
        ringerId: 'Guest',
        darkMode: _darkMode,
      );

  /// User selected value on tapping the profile.
  ///
  /// Returns true of user selects profile settings.
  bool get didSelectRinger => _didSelectRinger;
  void tapOnProfile(bool selected) {
    _didSelectRinger = selected;
    notifyListeners();
  }

  /// User selected value of app mode.
  ///
  /// Returns true if user selects dark mode.
  bool get darkMode => _darkMode;
  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  /// User selected value of Euring Code access.
  ///
  /// Returns true if user taps on Euring Code file.
  bool get didTapOnEuringCode => _tapOnEuringCode;
  void tapOnEuringCode(bool selected) {
    _tapOnEuringCode = selected;
    notifyListeners();
  }

  /// Returns true if user taps on Add Ring Series.
  bool get didSelectAddRingSeries => _didSelectAddRingSeriesPath;
  void selectAddRingSeries(bool selected) {
    _didSelectAddRingSeriesPath = selected;
    notifyListeners();
  }

  /// Returns true if user taps on Add Ring Series.
  bool get didSelectAddLostRingPath => _didSelectAddLostRingPath;
  void selectAddLostRing(bool selected) {
    _didSelectAddLostRingPath = selected;
    notifyListeners();
  }

  /// Returns true if user taps on Add Ring Series.
  bool get didSelectOrderRingsPath => _didSelectOrderRingsPath;
  void selectOrderRings(bool selected) {
    _didSelectOrderRingsPath = selected;
    notifyListeners();
  }

  /// A variable used in showing profile screen.
  ///
  /// If true, profile screen is shown.
  var _didSelectRinger = false;

  /// A variable used to set application mode.
  ///
  /// If true, dark mode is set.
  var _darkMode = false;

  /// A variable used in showing EURING code pdf file.
  ///
  /// If true, EURING code pdf file is downloaded, needs online access.
  var _tapOnEuringCode = false;

  // Application current paths for navigation
  var _didSelectAddRingSeriesPath = false;
  var _didSelectAddLostRingPath = false;
  var _didSelectOrderRingsPath = false;
}
