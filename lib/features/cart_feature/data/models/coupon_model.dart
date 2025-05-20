import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/coupon_entity.dart';

class CouponModel extends CouponEntity {
  final int? couponId;
  final String? couponName;
  final int? couponCount;
  final int? couponDiscount;
  final String? couponExpiredate;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDiscount,
      this.couponExpiredate})
      : super(
            couponId: couponId,
            couponName: couponName,
            couponCount: couponCount,
            couponDiscount: couponDiscount,
            couponExpiredate: couponExpiredate);

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      couponId: json['coupon_id'],
      couponName: json['coupon_name'],
      couponCount: json['coupon_count'],
      couponDiscount: json['coupon_discount'],
      couponExpiredate: json['coupon_expiredate'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = couponId;
    data['coupon_name'] = couponName;
    data['coupon_count'] = couponCount;
    data['coupon_discount'] = couponDiscount;
    data['coupon_expiredate'] = couponExpiredate;
    return data;
  }
}
