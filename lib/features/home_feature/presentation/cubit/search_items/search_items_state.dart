part of 'search_items_cubit.dart';

sealed class SearchItemsState extends Equatable {
  const SearchItemsState();

  @override
  List<Object> get props => [];
}

final class SearchItemsInitial extends SearchItemsState {}

final class SearchItemsLoading extends SearchItemsState {}

final class SearchItemsLoaded extends SearchItemsState {
  final List<ItemsEntity> items;

  SearchItemsLoaded({required this.items});
  @override
  List<Object> get props => [items];
}

final class SearchItemsFailed extends SearchItemsState {}
