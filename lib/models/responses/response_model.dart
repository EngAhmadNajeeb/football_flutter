import 'dart:convert';

import 'package:football_flutter/models/fixture_models/paging_model.dart';

class ResponseModel {
  String? message;
  String? errors;
  PagingModel? paging;
  dynamic response;
  ResponseModel({
    this.message,
    this.errors,
    this.paging,
    required this.response,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'errors': errors,
      'paging': paging?.toMap(),
      'response': response,
    };
  }

  factory ResponseModel.fromMap(Map<String, dynamic> map) {
    String? err = json.encode(map['errors']);
    if (err == '[]') {
      err = null;
    }
    return ResponseModel(
      message: map['message'],
      errors: err,
      paging: map['paging'] != null ? PagingModel.fromMap(map['paging']) : null,
      response: map['response'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseModel.fromJson(String source) =>
      ResponseModel.fromMap(json.decode(source));
}
