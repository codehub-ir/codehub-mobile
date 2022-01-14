import 'package:codehub/services/storage/storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

final getIt = GetIt.instance;

void serviceLocator() async {
  Storage storageClass = Storage();
  GetStorage storage = GetStorage();
  await GetStorage.init();

  // storage
  getIt.registerSingleton<GetStorage>(storage);
  getIt.registerSingleton<Storage>(storageClass);
}
