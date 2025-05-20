import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/cart_entity.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/coupon_entity.dart';

abstract class CartRemoteDateResource {
  Future<RequestResult> addToCart(String usersId, String itemsId);
  Future<RequestResult> removeFromCart(String usersId, String itemsId);
  Future<List<CartEntity>> viewCartItems(String usersId);
  Future<CouponEntity> checkCoupon(String couponName);
}
