import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import '../config/app_config.dart';
import '../helpers/api_helper.dart';
import '../models/objects.dart';

class ApiService {
  Future<ResponseModel> post(endpoint, data) async {
    try {
      final response = await ApiHelper.getDio().post(
        '${AppLocalConfig.apiBaseUrl}/$endpoint',
        data: data,
      );

      Logger().w(response);

      if (response.statusCode != 200) {
        return ResponseModel(
          status: 'error',
          data: response.statusMessage ?? 'Something went wrong!',
          message: 'Something went wrong!',
        );
      }

      ResponseModel responseObject = ResponseModel.fromJson(response.data);

      return responseObject;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return ResponseModel(
          status: 'error',
          data: 'Session expired, please login again.',
          message: 'Session expired, please login again.',
        );
      }

      if (e.response?.statusCode == 422) {
        return ResponseModel(
          status: 'error',
          data: 'Validation Error',
          message: e.response!.data['data']['0'],
        );
      }

      Logger().w(e.response);

      return ResponseModel(
        status: 'error',
        data: e.response?.data?['message'] ?? 'Something went wrong!',
        message: 'Something went wrong!',
      );
    } catch(e) {
      return ResponseModel(
        status: 'error',
        data: e.toString(),
        message: e.toString(),
      );
    }
  }

  Future<ResponseModel> put(endpoint, data) async {
    try {
      final response = await ApiHelper.getDio().put(
        '${AppLocalConfig.apiBaseUrl}/$endpoint',
        data: data,
      );

      Logger().f(response);

      if (response.statusCode == 422) {
        return ResponseModel(
          status: 'error',
          data: 'Validation Error',
          message: response.data['data']['0'],
        );
      }

      if (response.statusCode != 200) {
        return ResponseModel(
          status: 'error',
          data: response.statusMessage ?? 'Something went wrong!',
          message: response.statusMessage ?? 'Something went wrong!',
        );
      }

      ResponseModel responseObject = ResponseModel.fromJson(response.data);

      return responseObject;
    } on DioException catch (e) {
      Logger().f(e.response?.statusCode);

      if (e.response?.statusCode == 401) {
        return ResponseModel(
          status: 'error',
          data: 'Session expired, please login again.',
          message: 'Session expired, please login again.',
        );
      }

      if (e.response?.statusCode == 422) {
        return ResponseModel(
          status: 'error',
          data: 'Validation Error',
          message: e.response!.data['data']['0'],
        );
      }

      return ResponseModel(
        status: 'error',
        data: e.response?.data?['message'] ?? 'Something went wrong!',
        message: e.response?.data?['message'] ?? 'Something went wrong!',
      );
    } catch(e) {
      Logger().f(e);

      return ResponseModel(
        status: 'error',
        data: e.toString(),
        message: e.toString(),
      );
    }
  }

  Future<ResponseModel> get(endpoint) async {
    try {
      final response = await ApiHelper.getDio().get(
        '${AppLocalConfig.apiBaseUrl}/$endpoint',
      );

      Logger().w(response);

      if (response.statusCode != 200) {
        return ResponseModel(
          status: 'error',
          data: response.statusMessage ?? 'Something went wrong!',
          message: response.statusMessage ?? 'Something went wrong!',
        );
      }

      ResponseModel responseObject = ResponseModel.fromJson(response.data);

      return responseObject;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return ResponseModel(
          status: 'error',
          data: 'Session expired, please login again.',
          message: 'Session expired, please login again.',
        );
      }

      if (e.response?.statusCode == 422) {
        return ResponseModel(
          status: 'error',
          data: 'Validation Error',
          message: e.response!.data['data']['0'],
        );
      }

      return ResponseModel(
        status: 'error',
        data: e.response?.data?['message'] ?? 'Something went wrong!',
        message: e.response?.data?['message'] ?? 'Something went wrong!',
      );
    } catch(e) {
      return ResponseModel(
        status: 'error',
        data: e.toString(),
        message: e.toString(),
      );
    }
  }

  Future<ResponseModel> delete(endpoint) async {
    try {
      final response = await ApiHelper.getDio().delete(
        '${AppLocalConfig.apiBaseUrl}/$endpoint',
      );

      Logger().w(response);

      if (response.statusCode != 200) {
        return ResponseModel(
          status: 'error',
          data: response.statusMessage ?? 'Something went wrong!',
          message: response.statusMessage ?? 'Something went wrong!',
        );
      }

      ResponseModel responseObject = ResponseModel.fromJson(response.data);

      return responseObject;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return ResponseModel(
          status: 'error',
          data: 'Session expired, please login again.',
          message: 'Session expired, please login again.',
        );
      }

      if (e.response?.statusCode == 422) {
        return ResponseModel(
          status: 'error',
          data: 'Validation Error',
          message: e.response!.data['data']['0'],
        );
      }

      return ResponseModel(
        status: 'error',
        data: e.response?.data?['message'] ?? 'Something went wrong!',
        message: e.response?.data?['message'] ?? 'Something went wrong!',
      );
    } catch(e) {
      return ResponseModel(
        status: 'error',
        data: e.toString(),
        message: e.toString(),
      );
    }
  }
}