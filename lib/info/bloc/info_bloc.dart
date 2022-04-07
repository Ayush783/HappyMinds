import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happyminds/info/service/sharedpref_service.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(const InfoState()) {
    on<LoadData>(_onLoadData);
  }

  final SharedPrefsServcie _prefsServcie = SharedPrefsServcie();

  void _onLoadData(LoadData event, Emitter emit) async {
    log('loading');
    final data = await _prefsServcie.getData();
    emit(
      state.copyWith(data: data),
    );
  }
}
