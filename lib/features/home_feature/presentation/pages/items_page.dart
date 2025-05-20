import 'package:enhanced_ecommerce_app/features/app_feature/const/sharedkeys.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/categories_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/items/items_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/widgets/items/customlistcategoriesitemspage.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/widgets/items/customlistproductsitemspage.dart';
import 'package:enhanced_ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_feature/const/appcolor.dart';

class ItemsPage extends StatefulWidget {
  final List<CategoriesEntity> categories;
  final CategoriesEntity category;

  const ItemsPage({
    super.key,
    required this.categories,
    required this.category,
  });

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  String uid = "";

  void getUid() {
    uid = sharedPreferences.getString(AppSharedKeys.id) ?? "";
  }

  @override
  void initState() {
    getUid();
    BlocProvider.of<ItemsCubit>(context).getItems(
        uid, ItemsEntity(itemsCategories: widget.category.categoriesId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemsController = BlocProvider.of<ItemsCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.category.categoriesName}"
          // "${translateDataBase(categories.categoriesName, categories.categoriesNameAr)}"
          ,
          style: const TextStyle(fontSize: 25, color: AppColor.primaryColor),
        ),
      ),
      body: ListView(
        children: [
          // CustomListCategoriesItemsPage(
          //   uid: uid,
          //   categories: widget.categories,
          // ),
          BlocBuilder<ItemsCubit, ItemsState>(
            builder: (context, state) {
              if (state is ItemsLoaded) {
                final items = state.items;
                itemsController.favouriteMap.clear;
                print("the state${state}");
                return GridView.builder(
                    itemCount: items.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: .7),
                    itemBuilder: (context, index) {
                      itemsController.favouriteMap[items[index].itemsId] =
                          items[index].favourites;
                      return CustomListProductsItemsPage(items: items[index]);
                    });
              } else {
                return const Center(
                  child: Text(" no data"),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
