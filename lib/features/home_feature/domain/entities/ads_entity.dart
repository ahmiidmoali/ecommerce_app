import 'package:equatable/equatable.dart';

class AdsEntity extends Equatable {
  final int? adsId;
  final String? adsImage;
  final int? adsType;
  final String? adsContent;
  final int? adsItemsid;

  AdsEntity(
      {this.adsId,
      this.adsImage,
      this.adsType,
      this.adsContent,
      this.adsItemsid});
  @override
  List<Object?> get props => [adsId, adsImage, adsType, adsContent, adsItemsid];
}
