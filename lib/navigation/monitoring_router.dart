import 'package:flutter/material.dart';

import 'monitoring_link.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class MonitoRingRouter extends RouterDelegate<MonitoRingLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final MonitoRingStateManager monStateManager;
}
