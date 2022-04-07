part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class MenuTapped extends HomeEvent {}

class FindPsychiatrist extends HomeEvent {
  final String communicationType;

  const FindPsychiatrist(this.communicationType);
}
