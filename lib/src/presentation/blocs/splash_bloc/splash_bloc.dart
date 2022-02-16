import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codehub/src/core/utils/custom_debugger/custom_debugger.dart';
import 'package:codehub/src/domain/usecases/check_intro_state_usecase.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckIntroStateUseCase _checkIntroStateUseCase;

  SplashBloc(this._checkIntroStateUseCase) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {});
    on<SplashPageOpened>((event, emit) async {
      try {
        await Future.delayed(const Duration(seconds: 2));
        bool state = await _checkIntroStateUseCase.call();

        if (state) {
          emit(ShowHomePage());
        } else {
          emit(ShowIntroPage());
        }
      } catch (e, s) {
        CustomDebugger.errorDebugger(e, s);
      }
    });
  }
}
