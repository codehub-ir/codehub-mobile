import 'package:bloc/bloc.dart';
import 'package:codehub/services/api_base_helper/api_base_helper.dart';
import 'package:codehub/src/core/constant/api_path/api_path.dart';
import 'package:codehub/src/core/resources/data_state.dart';
import 'package:codehub/src/core/utils/custom_debugger/custom_debugger.dart';
import 'package:codehub/src/data/models/event_model.dart';
import 'package:codehub/src/domain/usecases/get_events_usecase.dart';
import 'package:codehub/src/injector.dart';
import 'package:equatable/equatable.dart';

part 'events_event.dart';

part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final GetEventsUseCase _getEventsUseCase;

  EventsBloc(this._getEventsUseCase) : super(EventsInitial()) {
    on<EventsEvent>((event, emit) {});
    on<InitialEvent>((event, emit) async {
      try {
        emit(EventsFetchLoading());

        DataState data = await _getEventsUseCase.call();

        emit(EventsFetchSuccess(data.data));
      } catch (e, s) {
        CustomDebugger.errorDebugger(e, s);
        emit(EventsFetchFailed(e.toString()));
      }
    });
  }
}
