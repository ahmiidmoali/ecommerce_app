part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<CategoriesEntity> categories;
  final List<ItemsEntity> items;
  final List<AdsEntity> ads;

  HomeLoaded(
      {required this.categories, required this.items, required this.ads});
  @override
  List<Object> get props => [categories, items, ads];
}

final class HomeFailed extends HomeState {}
