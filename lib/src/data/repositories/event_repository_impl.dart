import 'package:codehub/src/domain/entities/event.dart';
import 'package:codehub/src/core/resources/data_state.dart';
import 'package:codehub/src/domain/repositories/event_repository.dart';

class EventRepositoryImpl implements EventRepository {
  @override
  Future<DataState<List<Event>>> getEvents() {
    throw UnimplementedError();
  }
}
