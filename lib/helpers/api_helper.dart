import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:nirsal/helpers/preference_helper.dart';

class ApiHelper {
  static final Dio _dio = Dio();
  Logger logger = Logger();

  static init() async {
    var token = await PreferenceHelper().getAccessToken();
    await setInterceptor(token);
  }

  static setInterceptor(String token) async {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Accept"] = "application/json";

          if (token != "") {
            options.headers["Authorization"] = "Bearer $token";
          }
          
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          // Do something with response data
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          return handler.resolve(e.response!);
        },
      ),
    );
  }

  static Dio getDio() {
    return _dio;
  }
}
