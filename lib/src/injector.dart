import 'package:codehub/services/storage/storage.dart';
import 'package:codehub/src/data/datasources/remote/api_service.dart';
import 'package:codehub/src/data/repositories/event_repository_impl.dart';
import 'package:codehub/src/domain/repositories/event_repository.dart';
import 'package:codehub/src/domain/usecases/get_events_usecase.dart';
import 'package:codehub/src/presentation/blocs/event_bloc/events_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;

void serviceLocator() async {
  Storage storageClass = Storage();
  GetStorage storage = GetStorage();
  await GetStorage.init();

  // storage
  getIt.registerSingleton<GetStorage>(storage);
  getIt.registerSingleton<Storage>(storageClass);

  // inject dio instance
  getIt.registerSingleton<Dio>(Dio());

  // inject api service
  getIt.registerSingleton<ApiService>(ApiService(getIt()));

  // inject repositories
  getIt.registerSingleton<EventRepository>(EventRepositoryImpl(getIt()));

  // inject usecases
  getIt.registerSingleton<GetEventsUseCase>(GetEventsUseCase(getIt()));

  // injects blocs
  getIt.registerFactory<EventsBloc>(() => EventsBloc(getIt()));
}
