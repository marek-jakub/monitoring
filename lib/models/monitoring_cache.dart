import 'package:shared_preferences/shared_preferences.dart';

/// A cache holding information about users having logged in and done
/// onboarding.
///
/// On user loggin out, cache values are invalidated.
class AppCache {
  /// Key used to access ringer's login  state.
  static const keyRinger = 'ringer';

  /// Key used to access ringers onboarding state.
  static const keyOnboarding = 'onboarding';

  /// On logout the cache holding ringer's status is invalidated.
  Future<void> invalidate() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(keyRinger, false);
    await preferences.setBool(keyOnboarding, false);
  }

  /// On login the app's login state is set to true.
  Future<void> cacheRinger() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(keyRinger, true);
  }

  Future<void> onboardingCompleted() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(keyOnboarding, true);
  }

  Future<bool> isRingerLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(keyRinger) ?? false;
  }

  Future<bool> isOnboardingComplete() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(keyOnboarding) ?? false;
  }
}
