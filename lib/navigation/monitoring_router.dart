import 'package:flutter/material.dart';
import 'package:monitoring/screens/onboarding_screen.dart';

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
