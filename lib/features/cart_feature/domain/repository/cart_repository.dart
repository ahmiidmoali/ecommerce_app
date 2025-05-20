import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/cart_entity.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/coupon_entity.dart';

import '../../../app_feature/global/functions/fetch_remote_data.dart';

abstract class CartRepository {
  Future<RequestResult> addToCart(String usersId, String itemsId);
  Future<RequestResult> removeFromCart(String usersId, String itemsId);
  Future<List<CartEntity>> viewCartItems(String usersId);
  Future<CouponEntity> checkCoupon(String couponName);
}

//add_to_cart_usecase remove_from_cart_usecase get_count_items_usecase view_cart_items_usecase  check_coupon_usecase