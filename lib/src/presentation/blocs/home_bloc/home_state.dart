part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class ProfilesFetchedSuccess extends HomeState {
  final List<GithubProfileModel> profiles;

  ProfilesFetchedSuccess(this.profiles);

  @override
  List<Object?> get props => [profiles];
}

class ProfilesFetchedLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class ProfilesFetchedFailed extends HomeState {
  final String error;

  ProfilesFetchedFailed(this.error);

  @override
  List<Object?> get props => [error];
}
