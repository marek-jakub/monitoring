import 'package:flutter/material.dart';

import 'models.dart';

/// Notifier and manager of ringer's profile.
///
/// Currently holds mock data.
class ProfileManager extends ChangeNotifier {
  Ringer get getRinger => Ringer(
        ringerId: '6000',
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

  var _didSelectRinger = false;
  var _darkMode = false;
  var _tapOnEuringCode = false;
}
