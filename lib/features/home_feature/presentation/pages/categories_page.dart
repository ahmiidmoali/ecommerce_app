import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/categories_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/pages/items_page.dart';
import 'package:enhanced_ecommerce_app/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesPage extends StatelessWidget {
  final List<CategoriesEntity> categories;
  const CategoriesPage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Category",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ItemsPage(
                    categories: categories, category: categories[index]),
              ));
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: SvgPicture.network(
                        "${AppLink.imagecategories}/${categories[index].categoriesImage}",
                        color: AppColor.black),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "${categories[index].categoriesName}"
                    // "${translateDataBase(categories.categoriesName, categories.categoriesNameAr)}"
                    ,
                    style: const TextStyle(
                        fontSize: 17, color: AppColor.primaryColor),
                  ),
                  const Spacer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
