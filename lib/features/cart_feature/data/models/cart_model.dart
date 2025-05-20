import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
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

  CartModel(
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
      this.itemsCategories})
      : super(
            itemsprice: itemsprice,
            itemscount: itemscount,
            cartId: cartId,
            cartUsersid: cartUsersid,
            cartItemsid: cartItemsid,
            cartOrders: cartOrders,
            itemsId: itemsId,
            itemsName: itemsName,
            itemsNameAr: itemsNameAr,
            itemsDesc: itemsDesc,
            itemsDescAr: itemsDescAr,
            itemsImage: itemsImage,
            itemsCount: itemsCount,
            itemsActive: itemsActive,
            itemsPrice: itemsPrice,
            itemsDiscount: itemsDiscount,
            itemsDatetime: itemsDatetime,
            itemsCategories: itemsCategories);

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      itemsprice: json['itemsprice'] + 0.0,
      itemscount: json['itemscount'],
      cartId: json['cart_id'],
      cartUsersid: json['cart_usersid'],
      cartItemsid: json['cart_itemsid'],
      cartOrders: json['cart_orders'],
      itemsId: json['items_id'],
      itemsName: json['items_name'],
      itemsNameAr: json['items_name_ar'],
      itemsDesc: json['items_desc'],
      itemsDescAr: json['items_desc_ar'],
      itemsImage: json['items_image'],
      itemsCount: json['items_count'],
      itemsActive: json['items_active'],
      itemsPrice: json['items_price'] + 0.0,
      itemsDiscount: json['items_discount'],
      itemsDatetime: json['items_datetime'],
      itemsCategories: json['items_categories'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['itemscount'] = this.itemscount;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_orders'] = this.cartOrders;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_datetime'] = this.itemsDatetime;
    data['items_categories'] = this.itemsCategories;
    return data;
  }
}
