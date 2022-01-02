part of 'events_bloc.dart';

abstract class EventsEvent extends Equatable {
  const EventsEvent();
}

class InitialEvent extends EventsEvent {
  @override
  List<Object?> get props => [];
}
