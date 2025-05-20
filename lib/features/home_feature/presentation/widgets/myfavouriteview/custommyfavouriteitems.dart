import 'package:cached_network_image/cached_network_image.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/const/sharedkeys.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/translatedatabase%20copy.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/favourite/favourite_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/pages/itemsdetails.dart';
import 'package:enhanced_ecommerce_app/linkapi.dart';
import 'package:enhanced_ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomMyFavouriteItems extends StatelessWidget {
  final ItemsEntity items;

  const CustomMyFavouriteItems({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final favouriteController = BlocProvider.of<FavouriteCubit>(context);
    final String userId = sharedPreferences.getString(AppSharedKeys.id) ?? "";
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ItemsDetails(items: items),
        ));
      },
      child: Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Hero(
                tag: items.itemsId!,
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imageitems}/${items.itemsImage!}",
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                "${translateDataBase(items.itemsName, items.itemsNameAr)}",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text("Rating 4.0"),
                  const SizedBox(
                    width: 5,
                  ),
                  ...List.generate(
                      5,
                      (index) => const Icon(
                            Icons.star,
                            size: 18,
                          ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "${items.itemsPrice} \$",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColor.primaryColor,
                        fontFamily: "sans"),
                  ),
                  IconButton(
                      onPressed: () {
                        favouriteController.removeFromFavouriteList(
                          userId,
                          items.itemsId.toString(),
                        );
                      },
                      icon: Icon(Icons.delete))
                ],
              )
            ]),
      ),
    );
  }
}
