import 'package:flutter/material.dart';

import '../navigation/monitoring_link.dart';

/// An information parser for app's url linking.
class MonitoRingRouteParser extends RouteInformationParser<MonitoRingLink> {
  /// Returns route information as [MonitoRingLink].
  @override
  Future<MonitoRingLink> parseRouteInformation(
      RouteInformation routeInformation) async {
    final link = MonitoRingLink.fromLocation(routeInformation.location);
    return link;
  }

  /// Returns path according to current location.
  ///
  /// @param configuration The link information as [MonitorRingLink].
  @override
  RouteInformation restoreRouteInformation(MonitoRingLink configuration) {
    final location = configuration.toLocation();
    return RouteInformation(location: location);
  }
}
