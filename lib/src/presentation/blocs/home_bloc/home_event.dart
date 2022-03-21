part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetGithubProfiles extends HomeEvent {
  @override
  List<Object?> get props => [];
}
