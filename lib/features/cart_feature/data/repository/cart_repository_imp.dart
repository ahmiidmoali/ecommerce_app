import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/data/data_sources/cart_remote_date_resource.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/cart_entity.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/coupon_entity.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/repository/cart_repository.dart';

class CartRepositoryImp extends CartRepository {
  final CartRemoteDateResource dataSource;

  CartRepositoryImp({required this.dataSource});
  @override
  Future<RequestResult> addToCart(String usersId, String itemsId) =>
      dataSource.addToCart(usersId, itemsId);

  @override
  Future<RequestResult> removeFromCart(String usersId, String itemsId) =>
      dataSource.removeFromCart(usersId, itemsId);

  @override
  Future<List<CartEntity>> viewCartItems(String usersId) =>
      dataSource.viewCartItems(usersId);

  @override
  Future<CouponEntity> checkCoupon(String couponName) =>
      dataSource.checkCoupon(couponName);
}
