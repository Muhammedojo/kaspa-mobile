import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  Future<Login> getUser() async {
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
  Future<void> setRememberMe(bool value) async {
    await _getPrefs().then((pref) {
      pref.setBool(KEY_REMEMBER_ME, value);
    });
  }

    @override
  Future<String?> getUsername() async{
    return await _getPrefs().then((pref) {
      return pref.getString(KEY_USERNAME) ?? "";
    });
  }

  @override
  Future<void> setUsername(String value) async{
    await _getPrefs().then((pref) {
      pref.setString(KEY_USERNAME, value);
    });
  }

    @override
  Future<bool?> getRememberMe(){
    return SharedPreferences.getInstance().then((value) async {
      return value.getBool(KEY_REMEMBER_ME);
    });
  }

}
