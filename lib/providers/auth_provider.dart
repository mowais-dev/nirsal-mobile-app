import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:nirsal/helpers/preference_helper.dart';

import '../helpers/api_helper.dart';
import '../models/objects.dart';
import '../services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();
  
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

      ResponseModel response = await apiService.post('auth/login', {
        "email": email,
        "password": password,
      });

      if (response.status == 'success') {
        authUser = UserModel.fromJson(response.data);
        String token = response.meta['token'];

        await PreferenceHelper().setAccessToken(token);
        await ApiHelper.setInterceptor(token);
        await getAccount(authUser!.id);
      }

      loading = false;
      return response;
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
      ResponseModel response = await apiService.get('settings/users/$id/profile');

      if (response.status == 'success') {
        authUser = UserModel.fromJson(response.data);

        await PreferenceHelper().setAuthUser(authUser!);
      }

      return response;
    } catch (e) {
      Logger().f(e);
      return ResponseModel(
        status: 'error',
        data: 'Something went wrong!',
        message: 'Something went wrong!',
      );
    }
  }
}