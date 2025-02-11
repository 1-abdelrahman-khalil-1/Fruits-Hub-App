import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalSharedprefrence {
static const String onboardingkey = "onboradingseen"; 
 static late SharedPreferences _pref;
 static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

 static Future<void> set(String key, bool value) async {
    await _pref.setBool(key, value);
  }
 static bool get(String key)  {
    return _pref.getBool(key)??false;
  }
}
