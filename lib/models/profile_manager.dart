import 'package:flutter/material.dart';

import 'models.dart';

class ProfileManager extends ChangeNotifier {
  Ringer get getRinger => Ringer(
        ringerId: '6000',
        darkMode: _darkMode,
      );

  bool get didSelectRinger => _didSelectRinger;
  bool get darkMode => _darkMode;
  bool get didTapOnEuringCode => _tapOnEuringCode;

  var _didSelectRinger = false;
  var _darkMode = false;
  var _tapOnEuringCode = false;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void tapOnEuringCode(bool selected) {
    _tapOnEuringCode = selected;
    notifyListeners();
  }

  void tapOnProfile(bool selected) {
    _didSelectRinger = selected;
    notifyListeners();
  }
}
