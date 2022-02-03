import 'package:codehub/src/core/resources/data_state.dart';
import 'package:codehub/src/domain/entities/event.dart';

abstract class EventRepository {
  Future<DataState<List<Event>>> getEvents();
}
