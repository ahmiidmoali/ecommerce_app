import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/coupon_entity.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/repository/cart_repository.dart';

class CheckCouponUsecase {
  final CartRepository repository;

  CheckCouponUsecase({required this.repository});
  Future<CouponEntity> call(String couponName) async {
    return await repository.checkCoupon(couponName);
  }
}
