import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:codehub/src/core/constant/app_strings/app_strings.dart';
import 'package:codehub/src/core/utils/custom_debugger/custom_debugger.dart';
import 'package:codehub/src/data/models/github_profile_model.dart';
import 'package:codehub/src/domain/usecases/get_github_profile_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../core/resources/data_state.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetGithubProfileUsecase _getGithubProfileUsecase;

  HomeBloc(this._getGithubProfileUsecase) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<GetGithubProfiles>((event, emit) async {
      try {
        emit(ProfilesFetchedLoading());
        List<GithubProfileModel> profiles = [];

        DataState profile1 =
            await _getGithubProfileUsecase.call(params: "mahmoud-eslami");
        DataState profile2 =
            await _getGithubProfileUsecase.call(params: "lnxpy");

        profiles..addAll([profile1.data, profile2.data]);
        emit(ProfilesFetchedSuccess(profiles));
      } on SocketException {
        emit(ProfilesFetchedFailed(socketExceptionErrorTitle));
      } catch (e, s) {
        CustomDebugger.errorDebugger(e, s);
        emit(ProfilesFetchedFailed(exceptionErrorTitle));
      }
    });
  }
}
