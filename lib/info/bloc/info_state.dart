part of 'info_bloc.dart';

class InfoState extends Equatable {
  const InfoState({
    this.data = const {},
    this.isLoading = true,
  });

  final Map<String, bool> data;
  final bool isLoading;

  InfoState copyWith({Map<String, bool>? data, bool isLoading = false}) {
    return InfoState(
      data: data ?? this.data,
      isLoading: isLoading,
    );
  }

  @override
  List<Object> get props => [data, isLoading];
}
