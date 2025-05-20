import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final double? itemsprice;
  final int? itemscount;
  final int? cartId;
  final int? cartUsersid;
  final int? cartItemsid;
  final int? cartOrders;
  final int? itemsId;
  final String? itemsName;
  final String? itemsNameAr;
  final String? itemsDesc;
  final String? itemsDescAr;
  final String? itemsImage;
  final int? itemsCount;
  final int? itemsActive;
  final double? itemsPrice;
  final int? itemsDiscount;
  final String? itemsDatetime;
  final int? itemsCategories;

  CartEntity(
      {this.itemsprice,
      this.itemscount,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
      this.cartOrders,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDatetime,
      this.itemsCategories});

  @override
  List<Object?> get props => [
        itemsprice,
        itemscount,
        cartId,
        cartUsersid,
        cartItemsid,
        cartOrders,
        itemsId,
        itemsName,
        itemsNameAr,
        itemsDesc,
        itemsDescAr,
        itemsImage,
        itemsCount,
        itemsActive,
        itemsPrice,
        itemsDiscount,
        itemsDatetime,
        itemsCategories
      ];
}
