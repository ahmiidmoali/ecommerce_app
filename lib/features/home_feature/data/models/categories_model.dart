import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/categories_entity.dart';

class CategoriesModel extends CategoriesEntity {
  final int? categoriesId;
  final String? categoriesName;
  final String? categoriesNameAr;
  final String? categoriesImage;
  final int? categoriesActive;
  final String? categoriesDatetime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesActive,
      this.categoriesDatetime})
      : super(
            categoriesId: categoriesId,
            categoriesName: categoriesName,
            categoriesNameAr: categoriesNameAr,
            categoriesImage: categoriesImage,
            categoriesActive: categoriesActive,
            categoriesDatetime: categoriesDatetime);

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
        categoriesId: json['categories_id'],
        categoriesName: json['categories_name'],
        categoriesNameAr: json['categories_name_ar'],
        categoriesImage: json['categories_image'],
        categoriesActive: json['categories_active'],
        categoriesDatetime: json['categories_datetime']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_active'] = categoriesActive;
    data['categories_datetime'] = categoriesDatetime;
    return data;
  }
}
