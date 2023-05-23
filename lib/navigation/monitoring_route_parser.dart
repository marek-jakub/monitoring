import 'package:flutter/material.dart';

import '../navigation/monitoring_link.dart';

class MonitoRingRouteParser extends RouteInformationParser<MonitoRingLink> {
  @override
  Future<MonitoRingLink> parseRouteInformation(
      RouteInformation routeInformation) async {
    final link = MonitoRingLink.fromLocation(routeInformation.location);
    return link;
  }

  @override
  RouteInformation restoreRouteInformation(MonitoRingLink configuration) {
    final location = configuration.toLocation();
    return RouteInformation(location: location);
  }
}
