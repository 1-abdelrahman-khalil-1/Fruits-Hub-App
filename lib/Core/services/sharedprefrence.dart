import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalSharedprefrence {
static const String onboardingkey = "onboradingseen"; 
static const String userkey = "user";
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
 static Future<void> setstring(String key, String value) async {
  await _pref.setString(key, value);
  }
 static Map<String, dynamic> getCurrentUserinMap(String key) {
  Map<String, dynamic> map = jsonDecode( _pref.getString(key)!);
  return  map;
 }
}
