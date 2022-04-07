import 'dart:developer';
import 'dart:math' as math;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happyminds/home/model/psychiatrist.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<MenuTapped>(_onMenuTapped);

    on<FindPsychiatrist>(_onFindPsychiatrist);
  }

  void _onMenuTapped(HomeEvent event, Emitter emit) {
    log(state.showMenu.toString());
    emit(
      state.copyWith(showMenu: !state.showMenu),
    );
  }

  void _onFindPsychiatrist(FindPsychiatrist event, Emitter emit) async {
    emit(
      state.copyWith(
        searching: true,
        showMenu: true,
        type: event.communicationType.getCommunication(),
      ),
    );
    //mock searching
    await Future.delayed(const Duration(seconds: 3));
    emit(
      state.copyWith(
        showMenu: true,
        type: event.communicationType.getCommunication(),
        ps: Psychiatrist.fromJson(
          mockData[math.Random().nextInt(mockData.length)],
        ),
      ),
    );
  }
}
