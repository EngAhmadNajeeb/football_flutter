import 'dart:developer';

import 'package:dio/dio.dart';
import 'app_config.dart';

class ApiService {
  static Future<Response<T>?> getApi<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    log(path);
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.getAppBaseUrl(),
      ),
    );
    dio.options.headers['x-rapidapi-key'] = 'f0289a9704b3f383d129843809909011';
    final Response<T> response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(
        validateStatus: (int? status) {
          if (status != null) return true;
          return false;
        },
      ),
    );
    return response;
  }
}
