import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/ads_entity.dart';

class AdsModel extends AdsEntity {
  final int? adsId;
  final String? adsImage;
  final int? adsType;
  final String? adsContent;
  final int? adsItemsid;

  AdsModel(
      {this.adsId,
      this.adsImage,
      this.adsType,
      this.adsContent,
      this.adsItemsid})
      : super(
            adsId: adsId,
            adsImage: adsImage,
            adsType: adsType,
            adsContent: adsContent,
            adsItemsid: adsItemsid);

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(
      adsId: json['ads_id'],
      adsImage: json['ads_image'],
      adsType: json['ads_type'],
      adsContent: json['ads_content'],
      adsItemsid: json['ads_itemsid'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data : new Map<String, dynamic>();
  //   data['ads_id'] : this.adsId;
  //   data['ads_image'] : this.adsImage;
  //   data['ads_type'] : this.adsType;
  //   data['ads_content'] : this.adsContent;
  //   data['ads_itemsid'] : this.adsItemsid;
  //   return data;
  // }
}
