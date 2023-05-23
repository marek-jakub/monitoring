import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  static const keyRinger = 'ringer';
  static const keyOnboarding = 'onboarding';

  Future<void> invalidate() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(keyRinger, false);
    await preferences.setBool(keyOnboarding, false);
  }

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
