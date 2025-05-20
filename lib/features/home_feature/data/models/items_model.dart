import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';

class ItemsModel extends ItemsEntity {
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
  final double? itemsafterdiscount;
  final String? itemsDatetime;
  final int? itemsCategories;
  final int? favourites;

  ItemsModel(
      {this.itemsId,
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
      this.itemsCategories,
      this.favourites,
      this.itemsafterdiscount})
      : super(
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
          itemsCategories: itemsCategories,
          itemsafterdiscount: itemsafterdiscount,
          favourites: favourites,
        );

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
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
      favourites: json['favourites'],
      itemsafterdiscount: json['itemsafterdiscount'] == null
          ? json['itemsafterdiscount']
          : json['itemsafterdiscount'] + 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_datetime'] = itemsDatetime;
    data['items_categories'] = itemsCategories;
    data['favourites'] = favourites;
    data['itemsafterdiscount'] = itemsafterdiscount;
    return data;
  }
}
