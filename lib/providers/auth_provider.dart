import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:nirsal/helpers/preference_helper.dart';

import '../dummy_data/users.dart';
import '../models/objects.dart';

class AuthProvider extends ChangeNotifier {
  // No network calls; we serve everything from dummy_data/users.dart
  bool _loading = false;
  UserModel? _authUser;

  /// Getters
  bool get loading => _loading;
  UserModel? get authUser => _authUser;

  /// Setters
  set loading(bool status) {
    _loading = status;
    notifyListeners();
  }

  set authUser(UserModel? value) {
    _authUser = value;
    notifyListeners();
  }

  Future<ResponseModel> login(String email, String password) async {
    try {
      loading = true;

      // Basic credential match against dummy users
      final user = dummyUsers.firstWhere(
        (u) => u['email'] == email && u['password'] == password,
        orElse: () => {},
      );

      if (user.isEmpty) {
        loading = false;
        return ResponseModel(
          status: 'error',
          data: 'Invalid credentials',
          message: 'Invalid email or password',
        );
      }

      final auth = UserModel.fromJson(
          Map<String, dynamic>.from(user)..remove('password'));
      authUser = auth;

      // Persist a dummy token and user so rest of app flows unchanged
      await PreferenceHelper().setAccessToken('dummy-token');
      await PreferenceHelper().setAuthUser(authUser!);

      loading = false;
      return ResponseModel(
        status: 'success',
        data: auth.toJson(),
        meta: {'token': 'dummy-token'},
        message: 'Logged in (dummy)',
      );
    } catch (e) {
      Logger().f(e);
      loading = false;

      return ResponseModel(
        status: 'error',
        data: 'Something went wrong!',
        message: 'Something went wrong!',
      );
    }
  }

  Future<ResponseModel> getAccount(int id) async {
    try {
      final user = dummyUsers.firstWhere(
        (u) => u['id'] == id,
        orElse: () => {},
      );

      if (user.isEmpty) {
        return ResponseModel(
          status: 'error',
          data: 'User not found',
          message: 'User not found',
        );
      }

      final auth = UserModel.fromJson(
          Map<String, dynamic>.from(user)..remove('password'));
      authUser = auth;
      await PreferenceHelper().setAuthUser(authUser!);

      return ResponseModel(
        status: 'success',
        data: auth.toJson(),
        message: 'Fetched account (dummy)',
        meta: null,
      );
    } catch (e) {
      Logger().f(e);
      return ResponseModel(
        status: 'error',
        data: 'Something went wrong!',
        message: 'Something went wrong!',
      );
    }
  }

  Future<void> logout() async {
    await PreferenceHelper().setAccessToken('');
    await PreferenceHelper().setRefreshToken('');
    await PreferenceHelper().setAuthUser(null);
    authUser = null;
  }
}
