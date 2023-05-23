class MonitoRingLink {
  static const String keyLoginPath = '/login';
  static const String keyOnboardingPath = '/onboarding';
  static const String keyHomePath = '/home';
  static const String keyProfilePath = '/profile';

  static const String keyTabParam = 'tab';

  String? location;
  int? currentTab;

  MonitoRingLink({
    this.location,
    this.currentTab,
  });

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
      default:
        return keyHomePath;
    }
  }
}
