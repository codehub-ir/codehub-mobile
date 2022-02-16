part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class SplashPageOpened extends SplashEvent {
  @override
  List<Object?> get props => [];
}
