part of 'chat_bloc.dart';

class ChatState extends Equatable {
  const ChatState({this.messages});

  final List<String>? messages;

  @override
  List<Object> get props => [
        messages ?? [],
      ];
}
