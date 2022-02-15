import 'package:codehub/src/domain/repositories/global_state_repository.dart';

import '../datasources/local/storage.dart';

class GlobalStateRepositoryImpl extends GlobalStateRepository {
  final Storage _storage;

  GlobalStateRepositoryImpl(this._storage);

  @override
  Future<bool> checkIntroState() async {
    bool? introState = _storage.readIntroState();

    if (introState == null || introState == false) {
      return false;
    } else {
      return true;
    }
  }
}
