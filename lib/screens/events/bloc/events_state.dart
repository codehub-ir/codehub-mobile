part of 'events_bloc.dart';

abstract class EventsState extends Equatable {
  const EventsState();
}

class EventsInitial extends EventsState {
  @override
  List<Object> get props => [];
}

class EventsFetchLoading extends EventsState {
  @override
  List<Object?> get props => [];
}

class EventsFetchSuccess extends EventsState {
  final List<EventsModel> events;

  EventsFetchSuccess(this.events);

  @override
  List<Object?> get props => [events];
}

class EventsFetchFailed extends EventsState {
  final String error;

  EventsFetchFailed(this.error);

  @override
  List<Object?> get props => [error];
}
