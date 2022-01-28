import 'package:codehub/src/core/resources/data_state.dart';
import 'package:codehub/src/core/usecase/usecase.dart';
import 'package:codehub/src/domain/entities/event.dart';
import 'package:codehub/src/domain/repositories/event_repository.dart';

class GetEventsUseCase implements UseCase<DataState<List<Event>>, Map> {
  final EventRepository _eventRepository;

  GetEventsUseCase(this._eventRepository);

  @override
  Future<DataState<List<Event>>> call({Map? params}) {
    return _eventRepository.getEvents();
  }
}
