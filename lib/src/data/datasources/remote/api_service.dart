import 'package:codehub/src/core/constant/api_path/api_path.dart';
import 'package:codehub/src/data/models/event_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: baseUrlPath)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(readEventListPath)
  Future<HttpResponse<List<EventsModel>>> getEvents();
}
