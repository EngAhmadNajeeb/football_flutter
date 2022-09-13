import 'package:dio/dio.dart';
import 'package:football_flutter/api/api_path.dart';
import 'package:football_flutter/api/api_service.dart';
import 'package:football_flutter/models/responses/response_model.dart';

class LineupsRepo {
  static Future<ResponseModel> getLineups(int fixtureId) async {
    final Response<dynamic>? response = await ApiService.getApi(
      ApiPaths.lineups,
      queryParameters: {'fixture': '$fixtureId'},
    );
    return ResponseModel.fromMap(response?.data);
  }
}
