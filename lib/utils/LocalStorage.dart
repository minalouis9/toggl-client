import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggl_client_app/models/User.dart';

class LocalStorage{

  static String _userKey = "USER_KEY";
  static String _rememberKey = "REMEMBER_ME";

  Future<void> saveUser(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userKey, jsonEncode(user.toJson()));
    await sharedPreferences.setBool("FIRST_LOGIN", true);
  }

  Future<User> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String jsonString = sharedPreferences.getString(_userKey);
    if(jsonString == null)
      return null;
    else
      return User.fromJson(jsonDecode(jsonString));
  }

  Future<bool> removeUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(_userKey);
  }

  Future<void> rememberUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(_rememberKey, true);
  }

  Future<bool> getRememberUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isRemembered = sharedPreferences.getBool(_rememberKey);
    if(isRemembered == null)
      return null;
    else
      return isRemembered;
  }

  Future<bool> removeRememberUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(_rememberKey);
  }
}