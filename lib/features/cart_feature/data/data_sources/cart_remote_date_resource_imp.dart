import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/fetch_remote_data.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/services/network_services.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/data/data_sources/cart_remote_date_resource.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/data/models/cart_model.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/data/models/coupon_model.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/cart_entity.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/coupon_entity.dart';
import 'package:enhanced_ecommerce_app/linkapi.dart';

class CartRemoteDateResourceImp extends CartRemoteDateResource {
  final NetworkServices networkServices;

  CartRemoteDateResourceImp({required this.networkServices});
  @override
  Future<RequestResult> addToCart(String usersId, String itemsId) async {
    try {
      return await networkServices.postCheckSuccess(
          link: AppLink.addcart,
          body: {"usersId": usersId, "itemsId": itemsId});
    } catch (e) {
      return RequestResult.exception;
    }
  }

  @override
  Future<RequestResult> removeFromCart(String usersId, String itemsId) async {
    try {
      return await networkServices.postCheckSuccess(
          link: AppLink.removecart,
          body: {"usersId": usersId, "itemsId": itemsId});
    } catch (e) {
      return RequestResult.exception;
    }
  }

  @override
  Future<List<CartEntity>> viewCartItems(String usersId) async {
    try {
      List<dynamic> responce = await networkServices
          .postGetData(link: AppLink.viewcart, body: {"usersId": usersId});

      List<CartEntity> cart = [];
      cart.addAll(responce.map(
        (e) => CartModel.fromJson(e),
      ));
      return cart;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<CouponEntity> checkCoupon(String couponName) async {
    try {
      Map<String, dynamic> response = await networkServices.postGetData(
          link: AppLink.checkcoupon, body: {"couponName": couponName});
      return CouponModel.fromJson(response);
    } catch (e) {
      throw Exception();
    }
  }
}
