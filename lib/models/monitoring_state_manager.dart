import 'dart:async';

import 'package:flutter/material.dart';

import 'monitoring_cache.dart';

class MonitoRingTab {
  static const int data = 0;
  static const int retraps = 1;
  static const int search = 2;
  static const int map = 3;
}

class MonitoRingStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  int _selectedTab = MonitoRingTab.data;
  final _appCache = AppCache();

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  void initializeApp() async {
    _loggedIn = await _appCache.isRingerLoggedIn();
    _onboardingComplete = await _appCache.isOnboardingComplete();

    Timer(const Duration(milliseconds: 2000), () {
      _initialized = true;
      notifyListeners();
    });
  }

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
