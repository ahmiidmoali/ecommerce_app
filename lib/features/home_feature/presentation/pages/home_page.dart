import 'dart:async';

import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/const/sharedkeys.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/widgets/customappbar.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/domain/entities/ads_entity.dart';

import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/home/home_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/search_items/search_items_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/pages/categories_page.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/pages/favouritepage.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/widgets/home/ads_board_screen.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/widgets/home/custom_items_search_list.dart';

import 'package:enhanced_ecommerce_app/features/home_feature/presentation/widgets/home/listcategorieshome.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/widgets/home/listitemshome.dart';
import 'package:enhanced_ecommerce_app/linkapi.dart';
import 'package:enhanced_ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String uid = "";
  int currentAdd = 0;
  late PageController pageController;
  late TextEditingController searchcontroller;
  Timer? _debounce;
  startSearch(String query) {
    if (query.isNotEmpty) {
      BlocProvider.of<SearchItemsCubit>(context).searchItems(query);
    } else {
      BlocProvider.of<SearchItemsCubit>(context).releaseSearch(query);
    }
  }

  void getUid() {
    uid = sharedPreferences.getString(AppSharedKeys.id) ?? "";
  }

  List<String> getImageUrls(List<AdsEntity> entities) {
    return entities
        .map((entity) => '${AppLink.imageads}/${entity.adsImage}')
        .toList();
  }

  @override
  void initState() {
    pageController = PageController(initialPage: currentAdd);
    searchcontroller = TextEditingController(text: "");
    getUid();
    BlocProvider.of<HomeCubit>(context).getHomeData(uid);

    super.initState();
  }

  @override
  void dispose() {
    searchcontroller.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(
          mycontroller: searchcontroller,
          onchanged: (value) {
            if (_debounce?.isActive ?? false) _debounce?.cancel();
            _debounce = Timer(const Duration(milliseconds: 500), () {
              startSearch(value);
            });
          },
          hinttext: "Find Product", //Find Product

          onpressfavourite: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const FavouritePage();
              },
            ));
          },
        ),
      ),
      body: BlocBuilder<SearchItemsCubit, SearchItemsState>(
        builder: (context, state) {
          if (state is SearchItemsLoading) {
            return const Center(
              child: Text("loading..........."),
            );
          }
          if (state is SearchItemsFailed) {
            return const Center(
              child: Text("no products is founded.."),
            );
          }
          if (state is SearchItemsLoaded) {
            final items = state.items;
            return CustomItemsSearchList(items: items);
          } else {
            return BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                print(state);
                if (state is HomeLoaded) {
                  final categories = state.categories;
                  final items = state.items;
                  final ads = state.ads;
                  final imageUrls = getImageUrls(ads);

                  return ListView(
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    children: [
                      SizedBox(
                        // width: double.infinity,
                        // height: 200,
                        child: AnimatedAdBoard(
                          imageUrls: imageUrls,
                          switchDuration: const Duration(
                              seconds: 5), // Change auto-switch interval
                          viewportFraction:
                              0.7, // Visible area for adjacent items
                          animationCurve:
                              Curves.easeOutBack, // Custom transition curve
                          onImageTap: (index) {},
                        ),
                      ),
                      // Center(//todo
                      //   child: SizedBox(
                      //       width: double.infinity,
                      //       height: 150,
                      //       child: PageView.builder(
                      //         onPageChanged: (value) {
                      //           currentAdd = value;
                      //         },
                      //         itemCount: ads.length,
                      //         controller: pageController,
                      //         itemBuilder: (context, index) => Container(
                      //           decoration: BoxDecoration(
                      //             image: DecorationImage(
                      //               image: NetworkImage(
                      //                   "${AppLink.imageads}/${ads[index].adsImage!}"),
                      //               fit: BoxFit.cover,
                      //             ),
                      //           ),
                      //         ),
                      //       )),
                      // ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "  Categories",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black),
                            ),
                            const Spacer(),
                            if (categories.length > 6)
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        CategoriesPage(categories: categories),
                                  ));
                                },
                                child: const Text(
                                  "View All",
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 20),
                                ),
                              )
                          ],
                        ),
                      ),
                      ListCategoriesHome(
                        length: categories.length,
                        categories: categories,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "    Top Selling",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black),
                            ),
                            const Spacer(),
                            if (items.length > 6)
                              MaterialButton(
                                onPressed: () {},
                                child: const Text(
                                  "View All",
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 20),
                                ),
                              )
                          ],
                        ),
                      ),
                      ListItemsHome(items: items),
                      const SizedBox(
                        height: 400,
                      )
                    ],
                  );
                } else {
                  return const Center(
                    child: Text("no data"),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
