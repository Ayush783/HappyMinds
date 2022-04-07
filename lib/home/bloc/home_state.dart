part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({
    this.showMenu = false,
  });

  final bool showMenu;

  HomeState copyWith({bool? showMenu}) {
    return HomeState(showMenu: showMenu!);
  }

  @override
  List<Object> get props => [showMenu];
}
