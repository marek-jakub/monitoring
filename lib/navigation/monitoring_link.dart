/// Holder of application internal links.
class MonitoRingLink {
  static const String keyLoginPath = '/login';
  static const String keyOnboardingPath = '/onboarding';
  static const String keyHomePath = '/';
  static const String keyProfilePath = '/profile';
  // Paths leading from profile
  static const String keyEuringCodePath = '/euring';
  static const String keyRingSeriesPath = '/addSeries';
  static const String keyLostRingPath = '/addLostRing';
  static const String keyOrderRingsPath = '/orderRings';
  // Paths from home
  static const String keyRetrapsPath = '/retraps';
  static const String keySearchPath = '/search';
  static const String keyMapPath = '/map';
  static const String keyAddSessionPath = '/addSession';
  static const String keyEditSessionPath = '/editSession';
  static const String keyAddRingPath = '/addRing';
  static const String keyEditRingPath = '/editRing';
  static const String keyReportPath = '/report';
  // Paths from retraps
  static const String keyAddRetrapPath = '/addRetrap';
  static const String keyEditRetrapPath = '/editRetrap';

  static const String keyTabParam = 'tab';

  /// Holds location used in routing.
  String? location;

  /// Holds the value of currently selected tab.
  int? currentTab;

  MonitoRingLink({
    this.location,
    this.currentTab,
  });

  /// Returns uri representation of location.
  ///
  /// @param location The name of location.
  static MonitoRingLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;

    final currentTab = int.tryParse(params[MonitoRingLink.keyTabParam] ?? '');

    final link = MonitoRingLink(
      location: uri.path,
      currentTab: currentTab,
    );

    return link;
  }

  /// Returns path to location.
  String toLocation() {
    // Can be used to return a path to a ring or session, using their IDs
    // String addKeyValuePair({
    //   required String key,
    //   String? value,
    // }) =>
    //     value == null ? '' : '$key=$value&';

    switch (location) {
      case keyLoginPath:
        return keyLoginPath;
      case keyOnboardingPath:
        return keyOnboardingPath;
      case keyHomePath:
        return keyHomePath;
      case keyProfilePath:
        return keyProfilePath;
      case keyEuringCodePath:
        return keyEuringCodePath;
      case keyRingSeriesPath:
        return keyRingSeriesPath;
      case keyLostRingPath:
        return keyLostRingPath;
      case keyOrderRingsPath:
        return keyOrderRingsPath;
      case keyRetrapsPath:
        return keyRetrapsPath;
      case keySearchPath:
        return keySearchPath;
      case keyMapPath:
        return keyMapPath;
      case keyAddSessionPath:
        return keyAddSessionPath;
      case keyEditSessionPath:
        return keyEditSessionPath;
      case keyAddRingPath:
        return keyAddRingPath;
      case keyEditRingPath:
        return keyEditRingPath;
      case keyReportPath:
        return keyReportPath;
      case keyAddRetrapPath:
        return keyAddRetrapPath;
      case keyEditRetrapPath:
        return keyEditRetrapPath;
      default:
        return keyHomePath;
    }
  }
}
