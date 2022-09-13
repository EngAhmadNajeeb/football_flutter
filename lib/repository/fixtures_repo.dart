import 'package:dio/dio.dart';
import 'package:football_flutter/api/api_path.dart';
import 'package:football_flutter/api/api_service.dart';
import 'package:football_flutter/models/responses/response_model.dart';

class FixturesRepo {
  static Future<ResponseModel> getFixtures() async {
    final Response<dynamic>? response = await ApiService.getApi(
      ApiPaths.fixtures,
      queryParameters: {'live': 'all'},
    );
    return ResponseModel.fromMap(response?.data);
  }
}
