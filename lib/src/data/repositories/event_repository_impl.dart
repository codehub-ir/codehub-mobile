import 'dart:io';
import 'package:codehub/src/data/datasources/remote/api_service.dart';
import 'package:codehub/src/domain/entities/event.dart';
import 'package:codehub/src/core/resources/data_state.dart';
import 'package:codehub/src/domain/repositories/event_repository.dart';
import 'package:dio/dio.dart';

class EventRepositoryImpl implements EventRepository {
  final ApiService _apiService;

  EventRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<Event>>> getEvents() async {
    try {
      final httpResponse = await _apiService.getEvents();
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
