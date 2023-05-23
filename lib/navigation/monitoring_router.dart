import 'package:flutter/material.dart';

import 'monitoring_link.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class MonitoRingRouter extends RouterDelegate<MonitoRingLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final MonitoRingStateManager monStateManager;
  final ProfileManager profileManager;
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
        // TODO: add path to screens
        );
  }

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
