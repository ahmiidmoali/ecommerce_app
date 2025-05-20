part of 'favourite_cubit.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteViewLoading extends FavouriteState {}

final class FavouriteViewLoaded extends FavouriteState {
  final List<ItemsEntity> items;

  FavouriteViewLoaded({required this.items});
  @override
  List<Object> get props => [items];
}

final class FavouriteRemoveFromViewFailed extends FavouriteState {
  final List<ItemsEntity> items;

  FavouriteRemoveFromViewFailed({required this.items});
  @override
  List<Object> get props => [items];
}

final class FavouriteViewFailed extends FavouriteState {
  @override
  List<Object> get props => [];
}

//------outSide viewPage
final class FavouriteSwitchSuccess extends FavouriteState {
  final int currentState;

  FavouriteSwitchSuccess({required this.currentState});
  @override
  List<Object> get props => [currentState];
}

final class FavouriteSwitchFailed extends FavouriteState {
  @override
  List<Object> get props => [];
}
