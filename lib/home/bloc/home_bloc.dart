import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<MenuTapped>(_onMenuTapped);
  }

  void _onMenuTapped(HomeEvent event, Emitter emit) {
    log(state.showMenu.toString());
    emit(
      state.copyWith(showMenu: !state.showMenu),
    );
  }
}
