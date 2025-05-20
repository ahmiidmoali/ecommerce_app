part of 'cart_cubit.dart';

sealed class CartViewState extends Equatable {
  @override
  List<Object> get props => [];
}

final class CartViewInitial extends CartViewState {
  @override
  List<Object> get props => [];
}

final class CartViewLoading extends CartViewState {
  @override
  List<Object> get props => [];
}

final class CartViewLoaded extends CartViewState {
  final List<CartEntity> cartItems;

  CartViewLoaded({required this.cartItems});
  @override
  List<Object> get props => [cartItems];
}

final class CartViewFailed extends CartViewState {
  @override
  List<Object> get props => [];
}

final class CartNewAddSuccess extends CartViewState {
  final List<CartEntity> cartItems;

  CartNewAddSuccess({required this.cartItems});
  @override
  List<Object> get props => [cartItems];
}

final class CartAddFailed extends CartViewState {
  @override
  List<Object> get props => [];
}

final class CartRemoveSuccess extends CartViewState {
  @override
  List<Object> get props => [];
}

final class CartRemoveFailed extends CartViewState {
  @override
  List<Object> get props => [];
}
