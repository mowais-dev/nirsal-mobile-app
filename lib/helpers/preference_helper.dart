import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/objects.dart';

class PreferenceHelper {
  setAccessToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', value);
  }

  Future<String> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  setRefreshToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('refresh_token', value);
  }

  Future<String> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('refresh_token') ?? '';
  }

  setAuthUser(UserModel? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setString('auth_user', value != null ? jsonEncode(value.toJson()) : '');
  }

  Future<UserModel?> getAuthUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return (prefs.getString('auth_user') != null && prefs.getString('auth_user') != '') ? UserModel.fromJson(jsonDecode(prefs.getString('auth_user')!)) : null;
  }
}
