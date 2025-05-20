part of 'items_cubit.dart';

sealed class ItemsState extends Equatable {
  const ItemsState();

  @override
  List<Object> get props => [];
}

final class ItemsInitial extends ItemsState {}

final class ItemsLoading extends ItemsState {}

final class ItemsLoaded extends ItemsState {
  final List<ItemsEntity> items;

  ItemsLoaded({required this.items});
  @override
  List<Object> get props => [items];
}

final class ItemsFailure extends ItemsState {}
