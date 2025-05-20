import 'package:equatable/equatable.dart';

class ItemsEntity extends Equatable {
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

  ItemsEntity({
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
    this.itemsafterdiscount,
    this.itemsDatetime,
    this.itemsCategories,
    this.favourites,
  });

  // TODO: implement props
  List<Object?> get props => [
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
        itemsafterdiscount,
        itemsDatetime,
        itemsCategories,
        favourites,
      ];
}
