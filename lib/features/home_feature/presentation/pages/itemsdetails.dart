import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/const/sharedkeys.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/translatedatabase%20copy.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/widgets/customprice_pres_itemdetails.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/pages/cart_page.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/items_entity.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/item_details/item_details_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/widgets/itemsdetails/customimageitemsdetails.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/widgets/itemsdetails/custompriceitemsdetails.dart';
import 'package:enhanced_ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsDetails extends StatefulWidget {
  final ItemsEntity items;
  const ItemsDetails({super.key, required this.items});

  @override
  State<ItemsDetails> createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails> {
  String userId = sharedPreferences.getString(AppSharedKeys.id) ?? "";
  @override
  void initState() {
    BlocProvider.of<ItemDetailsCubit>(context)
        .getCountData(userId, widget.items.itemsId.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // int countitems = 0;
    final controller = BlocProvider.of<ItemDetailsCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "   ${widget.items.itemsName}",
          maxLines: 1,
          style: const TextStyle(
              fontSize: 21,
              color: AppColor.primaryColor,
              overflow: TextOverflow.ellipsis),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
            },
            child: const Text(
              "Go To Cart", //Go To Cart
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          CustomImageItemsDetails(
            items: widget.items,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              translateDataBase(
                  "${widget.items.itemsName}", "${widget.items.itemsNameAr}"),
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 25, color: AppColor.largetext),
            ),
          ),
          const Text(
            " Add To Cart",
            style: TextStyle(fontSize: 21, color: AppColor.primaryColor),
          ),
          CustomPriceItemsDetails(
              countwidget: BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
                  builder: (context, state) {
                if (state is ItemDetailsGetCountLoading) {
                  return const CircularProgressIndicator();
                }
                return Text(
                  "${state.itemCount}",
                  style: const TextStyle(fontSize: 25, height: 1),
                );
              }),
              addBottun: () {
                controller.increase(userId, widget.items.itemsId.toString());
              },
              removeBottun: () {
                controller.decrease(userId, widget.items.itemsId.toString());
              },
              price: widget.items.itemsDiscount != 0
                  ? Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned(
                          top: -40,
                          child: PriceDisItemDetails(
                            price: "${widget.items.itemsPrice!.toInt()} ",
                          ),
                        ),
                        PricePresItemDetails(
                          price:
                              "${(widget.items.itemsPrice! - widget.items.itemsPrice! * widget.items.itemsDiscount! / 100).toInt()}  ",
                        )
                      ],
                    )
                  : PricePresItemDetails(
                      price: "${widget.items.itemsPrice!.toInt()}  ",
                    )),
          const Divider(
            color: AppColor.primaryColor,
            thickness: .2,
          ),
          const Text(
            " Specification",
            style: TextStyle(fontSize: 23, color: AppColor.primaryColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              translateDataBase(
                  "${widget.items.itemsDesc}", "${widget.items.itemsDescAr}"),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
