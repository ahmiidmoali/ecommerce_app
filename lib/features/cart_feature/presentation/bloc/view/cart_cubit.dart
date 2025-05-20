import 'package:bloc/bloc.dart';

import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/cart_entity.dart';

import 'package:enhanced_ecommerce_app/features/cart_feature/domain/usecases/view_cart_items_usecase.dart';

import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartViewCubit extends Cubit<CartViewState> {
  final ViewCartItemsUsecase viewCartItemsUsecase;

  CartViewCubit({
    required this.viewCartItemsUsecase,
  }) : super(CartViewInitial());
  List<CartEntity> cartItems = [];
  Future<void> viewCartItems(String usersId) async {
    try {
      emit(CartViewLoading());

      await viewCartItemsUsecase.call(usersId).then(
        (data) {
          cartItems.clear();
          cartItems = data;
          emit(CartViewLoaded(cartItems: cartItems));
        },
      );
    } catch (e) {
      emit(CartViewFailed());
    }
  }
}
