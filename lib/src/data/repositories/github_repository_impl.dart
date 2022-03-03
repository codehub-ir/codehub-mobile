import 'dart:io';

import 'package:codehub/src/core/resources/data_state.dart';
import 'package:codehub/src/data/models/github_profile_model.dart';
import 'package:codehub/src/domain/repositories/github_repository.dart';
import 'package:dio/dio.dart';

import '../datasources/remote/api_service.dart';

class GithubRepositoryImpl implements GithubRepository {
  final ApiService _apiService;

  GithubRepositoryImpl(this._apiService);

  @override
  Future<DataState<GithubProfileModel>> getProfile(String username) async {
    try {
      final httpResponse = await _apiService.getGithubProfile(username);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
