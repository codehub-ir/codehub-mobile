import 'package:codehub/src/core/resources/data_state.dart';
import 'package:codehub/src/core/usecase/usecase.dart';
import 'package:codehub/src/data/models/github_profile_model.dart';
import 'package:codehub/src/domain/repositories/github_repository.dart';

class GetGithubProfileUsecase
    implements UseCase<DataState<GithubProfileModel>, String> {
  final GithubRepository _githubProfileRepository;

  GetGithubProfileUsecase(this._githubProfileRepository);

  @override
  Future<DataState<GithubProfileModel>> call({String? params}) async {
    return _githubProfileRepository.getProfile(params!);
  }
}
