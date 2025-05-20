import 'package:equatable/equatable.dart';

class CategoriesEntity extends Equatable {
  final int? categoriesId;
  final String? categoriesName;
  final String? categoriesNameAr;
  final String? categoriesImage;
  final int? categoriesActive;
  final String? categoriesDatetime;

  CategoriesEntity(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesActive,
      this.categoriesDatetime});
  @override
  // TODO: implement props
  List<Object?> get props => [
        categoriesId,
        categoriesName,
        categoriesNameAr,
        categoriesImage,
        categoriesActive,
        categoriesDatetime
      ];
}
