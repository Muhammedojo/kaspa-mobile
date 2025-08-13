import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/model/last_request_time.dart';
import '../../data/model/login.dart';
import '../../utils/const.dart';
import '../istorage.dart';

class SharedPreferenceImpl implements CacheStorage {
  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String?> getString(String key) async {
    return await _getPrefs().then((pref) {
      return pref.getString(key);
    });
  }

  @override
  Future<Login> getLoggedInUser() async {
    String? encodedUser = await getString(KEY_LOGIN_OBJECT);
    try {
      if (encodedUser != null && encodedUser.isNotEmpty) {
        return Login.fromJson(jsonDecode(encodedUser));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return Login();
  }

  @override
  Future<LastRequestTime> getLastRequestTime() async {
    String? encodedObject = await getString(KEY_LAST_REQUEST_TIME_OBJECT);
    if (encodedObject != null && encodedObject.isNotEmpty) {
      return LastRequestTime.fromJson(jsonDecode(encodedObject));
    }
    return LastRequestTime();
  }

  @override
  Future<bool?> isLoggedIn() {
    return SharedPreferences.getInstance().then((value) async {
      return value.getBool(KEY_IS_USER_LOGGED_IN);
    });
  }

  @override
  Future<void> setLoggedIn(bool status) async {
    return SharedPreferences.getInstance().then((value) async {
      await value.setBool(KEY_IS_USER_LOGGED_IN, status);
    });
  }

  @override
  Future<void> setRememberMe(bool value) async {
    await _getPrefs().then((pref) {
      pref.setBool(KEY_REMEMBER_ME, value);
    });
  }

  @override
  Future<String?> getThemeSetting() async {
    return await getString(KEY_THEME_SETTING);
  }

  @override
  Future<void> setThemeSetting(String theme) async {
    await _getPrefs().then((pref) {
      pref.setString(KEY_THEME_SETTING, theme);
    });
  }

  @override
  void saveLastRequestObject(LastRequestTime object) async {
    await _getPrefs().then((pref) {
      String encodedObject = json.encode(object);
      pref.setString(KEY_LAST_REQUEST_TIME_OBJECT, encodedObject);
    });
  }

  @override
  Future<Map<String, dynamic>> getLastRequestTimeMap() async {
    String? encodedObject = await getString(KEY_LAST_REQUEST_TIME_OBJECT);
    if (encodedObject != null && encodedObject.isNotEmpty) {
      return jsonDecode(encodedObject);
    }
    return {};
  }

  @override
  void saveLoggedInUser(Login user) async {
    await _getPrefs().then((pref) {
      String encodedUser = json.encode(user);
      pref.setString(KEY_LOGIN_OBJECT, encodedUser);
    });
  }

  @override
  Future<String?> getUsername() async {
    return await _getPrefs().then((pref) {
      return pref.getString(KEY_USERNAME) ?? "";
    });
  }

  @override
  Future<void> setUsername(String value) async {
    await _getPrefs().then((pref) {
      pref.setString(KEY_USERNAME, value);
    });
  }

  @override
  Future<bool?> getRememberMe() {
    return SharedPreferences.getInstance().then((value) async {
      return value.getBool(KEY_REMEMBER_ME);
    });
  }
}
