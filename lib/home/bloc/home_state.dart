part of 'home_bloc.dart';

enum CommunicationType {
  call,
  videoCall,
  chat,
  none,
}

extension StringX on String {
  CommunicationType getCommunication() {
    switch (this) {
      case 'call':
        return CommunicationType.call;
      case 'videoCall':
        return CommunicationType.videoCall;
      case 'chat':
        return CommunicationType.chat;
      default:
        throw Exception('Unexpected value found');
    }
  }
}

class HomeState extends Equatable {
  const HomeState({
    this.showMenu = false,
    this.searching = false,
    this.ps,
    this.communicationType,
  });

  final bool showMenu;
  final bool searching;
  final Psychiatrist? ps;
  final CommunicationType? communicationType;

  HomeState copyWith({
    bool? showMenu,
    bool searching = false,
    Psychiatrist? ps,
    CommunicationType? type,
  }) {
    return HomeState(
      showMenu: showMenu!,
      searching: searching,
      ps: ps ?? const Psychiatrist.empty(),
      communicationType: communicationType ?? CommunicationType.none,
    );
  }

  @override
  List<Object> get props => [showMenu, searching, ps!, communicationType!];
}
