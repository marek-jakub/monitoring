import 'dart:async';

import 'package:flutter/material.dart';

import 'monitoring_cache.dart';

class MonitoRingTab {
  static const int data = 0;
  static const int retraps = 1;
  static const int search = 2;
  static const int map = 3;
}

/// Information for app initialization, onboarding, login and tab
/// selection.
///
/// Application splash, login and onboarding screens.
class MonitoRingStateManager extends ChangeNotifier {
  /// On app first start it is false to show initialization screen.
  bool _initialized = false;

  /// On first login it is false to let user login.
  bool _loggedIn = false;

  /// On first app start it is false to show onborading messages.
  bool _onboardingComplete = false;

  /// The value of selected tab.
  int _selectedTab = MonitoRingTab.data;

  /// Holds app state.
  final _appCache = AppCache();

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  /// Shows initialization message on app start.
  ///
  /// If the user is not logged in, shows login screen.
  /// If the user hasn't gone through onboarding, shows onboarding messages.
  void initializeApp() async {
    _loggedIn = await _appCache.isRingerLoggedIn();
    _onboardingComplete = await _appCache.isOnboardingComplete();

    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;
      notifyListeners();
    });
  }

  /// Stores login credentials.
  ///
  /// @param username The ringer ID.
  /// @param password The ringer password.
  void login(String username, String password) async {
    _loggedIn = true;
    await _appCache.cacheRinger();
    notifyListeners();
  }

  void completeOnboarding() async {
    _onboardingComplete = true;
    await _appCache.onboardingCompleted();
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void logout() async {
    _loggedIn = false;
    _selectedTab = 0;
    await _appCache.invalidate();

    initializeApp();
    notifyListeners();
  }
}
