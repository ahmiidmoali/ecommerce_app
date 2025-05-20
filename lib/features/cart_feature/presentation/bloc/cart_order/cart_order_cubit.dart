import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/data/models/cart_order_dto.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/cart_entity.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/coupon_entity.dart';
import 'package:enhanced_ecommerce_app/features/checkout_feature/domain/entities/address_entity.dart';

class CartOrderCubit extends Cubit<CartOrderDto> {
  CartOrderCubit() : super(CartOrderDto());
  addItems(
      {required List<CartEntity> cart,
      required CouponEntity coupon,
      required double totalPrice,
      required double totalPriceAfterCharges}) {
    emit(state.copyWith(
        cart: cart,
        coupon: coupon,
        totalPrice: totalPrice,
        totalPriceAfterCharges: totalPriceAfterCharges));
  }

  addAddress({required AddressEntity address}) {
    emit(state.copyWith(address: address));
  }

  addPaymentMethod({required String paymentMethod}) {
    emit(state.copyWith(paymentMethod: paymentMethod));
  }
}
