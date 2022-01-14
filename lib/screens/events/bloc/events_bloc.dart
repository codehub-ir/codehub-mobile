import 'package:bloc/bloc.dart';
import 'package:codehub/constant/api_path/api_path.dart';
import 'package:codehub/screens/events/model/event_model.dart';
import 'package:codehub/services/api_base_helper/api_base_helper.dart';
import 'package:codehub/utils/custom_debugger/custom_debugger.dart';
import 'package:equatable/equatable.dart';

part 'events_event.dart';

part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc() : super(EventsInitial()) {
    on<EventsEvent>((event, emit) {});
    on<InitialEvent>((event, emit) async {
      try {
        emit(EventsFetchLoading());

        List data = await ApiBaseHelper.get(readEventListPath);

        print(data);

        List<EventsModel> eventsList =
            data.map((e) => EventsModel.fromJson(e)).toList();

        emit(EventsFetchSuccess(eventsList));
      } catch (e, s) {
        CustomDebugger.errorDebugger(e, s);
        emit(EventsFetchFailed(e.toString()));
      }
    });
  }
}
