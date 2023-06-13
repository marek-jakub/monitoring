import 'package:flutter/material.dart';

import '../models/models.dart';
import '../screens/screens.dart';

import 'monitoring_link.dart';

/// A notifier and delegate for screen routing.
///
/// Requires screen access.
class MonitoRingRouter extends RouterDelegate<MonitoRingLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  /// App state manager.
  final MonitoRingStateManager monStateManager;

  /// User profile manager.
  final ProfileManager profileManager;

  /// Ringer data manager.
  final RingDataManager ringDataManager;

  MonitoRingRouter({
    required this.monStateManager,
    required this.profileManager,
    required this.ringDataManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    monStateManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
    ringDataManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    monStateManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    ringDataManager.removeListener(notifyListeners);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!monStateManager.isInitialized) ...[
          SplashScreen.page(),
        ] else if (monStateManager.isInitialized &&
            !monStateManager.isLoggedIn) ...[
          LoginScreen.page(),
        ] else if (monStateManager.isLoggedIn &&
            !monStateManager.isOnboardingComplete) ...[
          OnboardingScreen.page(),
        ] else ...[
          Home.page(monStateManager.getSelectedTab),
          if (profileManager.didSelectRinger)
            ProfileScreen.page(profileManager.getRinger),
          if (ringDataManager.newSession) AddSessionScreen.page(),
          if (ringDataManager.editSession) EditSessionScreen.page(),
          if (ringDataManager.newRing) AddRingScreen.page(),
          if (ringDataManager.editRing) EditRingScreen.page(),
          if (ringDataManager.newRetrap) AddRetrapScreen.page(),
          if (ringDataManager.editRetrap) EditRetrapScreen.page(),
          if (ringDataManager.newRingSeries) AddRingSeriesScreen.page(),
          if (ringDataManager.newLostRing) LostRingsScreen.page(),
        ]
      ],
    );
  }

  /// Defines what happens on pop page by the user.
  ///
  /// @param route The navigator route.
  /// @param result The pop page destination.
  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == MonitoRingPages.onboardingPath) {
      monStateManager.logout();
    }

    if (route.settings.name == MonitoRingPages.profilePath) {
      profileManager.tapOnProfile(false);
    }

    if (route.settings.name == MonitoRingPages.euringCodePath) {
      profileManager.tapOnEuringCode(false);
    }

    return true;
  }

  /// Returns path according to application state
  MonitoRingLink getCurrentPath() {
    if (!monStateManager.isLoggedIn) {
      return MonitoRingLink(location: MonitoRingLink.keyLoginPath);
    } else if (!monStateManager.isOnboardingComplete) {
      return MonitoRingLink(location: MonitoRingLink.keyOnboardingPath);
    } else if (profileManager.didSelectRinger) {
      return MonitoRingLink(location: MonitoRingLink.keyProfilePath);
    } else {
      return MonitoRingLink(
          location: MonitoRingLink.keyHomePath,
          currentTab: monStateManager.getSelectedTab);
    }
  }

  @override
  MonitoRingLink get currentConfiguration => getCurrentPath();

  /// Sets url path routing.
  ///
  /// @param configuration The link holding location and tab.
  @override
  Future<void> setNewRoutePath(MonitoRingLink configuration) async {
    switch (configuration.location) {
      case MonitoRingLink.keyProfilePath:
        profileManager.tapOnProfile(true);
        break;
      case MonitoRingLink.keyHomePath:
        monStateManager.goToTab(configuration.currentTab ?? 0);
        profileManager.tapOnProfile(false);
        break;
      // TODO: Add paths to session, ring
      default:
        break;
    }
  }
}
