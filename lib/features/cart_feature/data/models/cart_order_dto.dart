import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/cart_entity.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/coupon_entity.dart';

import '../../../checkout_feature/domain/entities/address_entity.dart';

class CartOrderDto {
  List<CartEntity>? cart;
  CouponEntity? coupon = CouponEntity(couponId: 0, couponDiscount: 0);
  AddressEntity? address;
  String? paymentMethod;
  double? totalPrice;
  double? totalPriceAfterCharges;

  CartOrderDto(
      {this.cart,
      this.coupon,
      this.address,
      this.paymentMethod,
      this.totalPrice,
      this.totalPriceAfterCharges});
  CartOrderDto copyWith(
      {List<CartEntity>? cart,
      CouponEntity? coupon,
      AddressEntity? address,
      String? paymentMethod,
      double? totalPrice,
      double? totalPriceAfterCharges}) {
    return CartOrderDto(
        cart: cart ?? this.cart,
        coupon: coupon ?? this.coupon,
        totalPrice: totalPrice ?? this.totalPrice,
        totalPriceAfterCharges:
            totalPriceAfterCharges ?? this.totalPriceAfterCharges,
        address: address ?? this.address,
        paymentMethod: paymentMethod ?? this.paymentMethod);
  }
}
