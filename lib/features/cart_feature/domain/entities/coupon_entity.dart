import 'package:equatable/equatable.dart';

class CouponEntity extends Equatable {
  final int? couponId;
  final String? couponName;
  final int? couponCount;
  final int? couponDiscount;
  final String? couponExpiredate;

  CouponEntity(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponDiscount,
      this.couponExpiredate});

  @override
  List<Object?> get props =>
      [couponId, couponName, couponCount, couponDiscount, couponExpiredate];
}
