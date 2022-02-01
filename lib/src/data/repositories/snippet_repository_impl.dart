import 'dart:io';

import 'package:codehub/src/data/datasources/remote/api_service.dart';
import 'package:codehub/src/data/models/snippet_model.dart';
import 'package:codehub/src/core/resources/data_state.dart';
import 'package:codehub/src/domain/repositories/snippet_repository.dart';
import 'package:dio/dio.dart';

class SnippetRepositoryImpl extends SnippetRepository {
  final ApiService _apiService;

  SnippetRepositoryImpl(this._apiService);

  @override
  Future<DataState<SnippetModel>> createSnippet(
      Map<String, dynamic> params) async {
    try {
      final httpResponse = await _apiService.createSnippet(params);

      if (httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data);
      }

      return DataFailed(DioError(
        requestOptions: httpResponse.response.requestOptions,
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
      ));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
