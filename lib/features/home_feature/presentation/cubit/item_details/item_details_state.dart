part of 'item_details_cubit.dart';

sealed class ItemDetailsState extends Equatable {
  final int itemCount;
  const ItemDetailsState({required this.itemCount});

  @override
  List<Object> get props => [itemCount];
}

final class ItemDetailsInitial extends ItemDetailsState {
  const ItemDetailsInitial({required super.itemCount});
  @override
  List<Object> get props => [itemCount];
}

final class ItemDetailsDecrease extends ItemDetailsState {
  const ItemDetailsDecrease({required super.itemCount});
  @override
  List<Object> get props => [itemCount];
}

// final class ItemDetailsAddFailed extends ItemDetailsState {}

final class ItemDetailsIncrease extends ItemDetailsState {
  const ItemDetailsIncrease({required super.itemCount});
  @override
  List<Object> get props => [itemCount];
}

// final class ItemDetailsRemoveFailed extends ItemDetailsState {}

final class ItemDetailsGetCountLoading extends ItemDetailsState {
  const ItemDetailsGetCountLoading({required super.itemCount});
  @override
  List<Object> get props => [itemCount];
}

final class ItemDetailsGetCountLoaded extends ItemDetailsState {
  const ItemDetailsGetCountLoaded({required super.itemCount});
  @override
  List<Object> get props => [itemCount];
}

final class ItemDetailsGetCountfailed extends ItemDetailsState {
  const ItemDetailsGetCountfailed({required super.itemCount});
  @override
  List<Object> get props => [itemCount];
}
