import 'package:shared_preferences/shared_preferences.dart';

class AppStorageService {
  AppStorageService();

  static const String _onboardingKey = 'onboarding_completed';

  Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();

  Future<void> setOnboardingCompleted() async{
    final prefs = await _prefs;
    await prefs.setBool(_onboardingKey, true);
  }

  Future<bool> isOnboardingCompleted() async{
    final prefs = await _prefs;
    return prefs.getBool(_onboardingKey) ?? false;
  }

}