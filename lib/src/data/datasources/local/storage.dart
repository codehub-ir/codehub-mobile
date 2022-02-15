import 'package:codehub/src/injector.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  /// required functions to handle intro state
  final introState = "intro";

  void writeIntroState() => getIt<GetStorage>().write(introState, true);

  readIntroState() => getIt<GetStorage>().read(introState);

  removeIntroState() => getIt<GetStorage>().remove(introState);

  ///
}
