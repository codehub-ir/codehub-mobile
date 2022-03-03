import 'package:codehub/src/core/resources/data_state.dart';
import 'package:codehub/src/data/models/github_profile_model.dart';

abstract class GithubRepository {
  Future<DataState<GithubProfileModel>> getProfile(String username);
}
