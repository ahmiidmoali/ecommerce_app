import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/const/sharedkeys.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/categories_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/items/items_cubit.dart';
import 'package:enhanced_ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListCategoriesItemsPage extends StatefulWidget {
  final List<CategoriesEntity> categories;
  final String uid;

  const CustomListCategoriesItemsPage({
    super.key,
    required this.categories,
    required this.uid,
  });

  @override
  State<CustomListCategoriesItemsPage> createState() =>
      _CustomListCategoriesItemsPageState();
}

class _CustomListCategoriesItemsPageState
    extends State<CustomListCategoriesItemsPage> {
  int? selectedCat;
  changeCat(index) async {
    selectedCat = index;
    setState(() {});
    await BlocProvider.of<ItemsCubit>(context).getItems(widget.uid,
        ItemsEntity(itemsCategories: widget.categories[index].categoriesId));
  }

  @override
  void initState() {
    selectedCat = sharedPreferences.getInt(AppSharedKeys.currentCatIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                changeCat(index);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                    border: selectedCat == index
                        ? const Border(
                            bottom: BorderSide(
                                width: 4, color: AppColor.primaryColor))
                        : null),
                child: Text(
                  "${widget.categories[index].categoriesName}",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 4,
            );
          },
          itemCount: widget.categories.length),
    );
  }
}

// class ListCategories extends StatefulWidget {
//   final String uid;
//   final int I;
//   final CategoriesEntity category;
//   const ListCategories(
//       {super.key, required this.category, required this.I, required this.uid});

//   @override
//   State<ListCategories> createState() => _ListCategoriesState();
// }

// class _ListCategoriesState extends State<ListCategories> {
//   int? selectedCat;
//   changeCat(val, id) async {
//     BlocProvider.of<ItemsCubit>(context).currentCatIndex = val;
//     // idCat = id;
//     // getItems(idCat!);

//     BlocProvider.of<ItemsCubit>(context).getItems(
//         widget.uid, ItemsEntity(itemsCategories: int.parse(widget.uid)));
//     setState(() {
//       selectedCat = widget.I;
//     });
//   }

//   @override
//   void initState() {
//     selectedCat = sharedPreferences.getInt(AppSharedKeys.currentCatIndex);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         changeCat(selectedCat, widget.category.categoriesId.toString());
//       },
//       child: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.only(left: 5, right: 5),
//         decoration: BoxDecoration(
//             border: BlocProvider.of<ItemsCubit>(context).currentCatIndex ==
//                     widget.I
//                 ? const Border(
//                     bottom: BorderSide(width: 4, color: AppColor.primaryColor))
//                 : null),
//         child: Text(
//           "${widget.category.categoriesName}",
//           style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
