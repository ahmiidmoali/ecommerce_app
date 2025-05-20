import 'package:enhanced_ecommerce_app/features/app_feature/const/sharedkeys.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/favourite/favourite_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/widgets/myfavouriteview/custommyfavouriteitems.dart';
import 'package:enhanced_ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    String usersId = sharedPreferences.getString(AppSharedKeys.id) ?? "";
    BlocProvider.of<FavouriteCubit>(context).viewFavourite(usersId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        // CustomAppBar(
        //   hinttext: "Find Product",
        //   onpressfavourite: () {},
        // ),
        BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            if (state is FavouriteViewLoaded) {
              final items = state.items;
              return GridView.builder(
                  itemCount: items.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: .7),
                  itemBuilder: (context, index) {
                    return CustomMyFavouriteItems(items: items[index]);
                  });
            } else {
              return const Center(
                child: Text(" no data"),
              );
            }
          },
        )
      ]),
    );
  }
}
