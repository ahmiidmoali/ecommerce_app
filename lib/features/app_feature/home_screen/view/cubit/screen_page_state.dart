part of 'screen_page_cubit.dart';

sealed class ScreenPageState extends Equatable {
  const ScreenPageState();

  @override
  List<Object> get props => [];
}

final class ScreenPageInitial extends ScreenPageState {}

final class ScreenPageSwitchPages extends ScreenPageState {
  final int current;

  ScreenPageSwitchPages({required this.current});
  List<Object> get props => [current];
}
