import 'package:codehub/src/core/usecase/usecase.dart';
import 'package:codehub/src/domain/repositories/global_state_repository.dart';

class CheckIntroStateUseCase implements UseCase<bool, bool> {
  final GlobalStateRepository _globalStateRepository;

  CheckIntroStateUseCase(this._globalStateRepository);

  @override
  Future<bool> call({bool? params}) {
    return _globalStateRepository.checkIntroState();
  }
}
