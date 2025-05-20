import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/home_screen/view/cubit/screen_page_cubit.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/home_screen/view/widgets/custombottomappbar.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = BlocProvider.of<ScreenPageCubit>(context);
    return BlocBuilder<ScreenPageCubit, ScreenPageState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.background,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            child: const Icon(
              Icons.shopping_basket_outlined,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
            },
          ),
          bottomNavigationBar: const CustomBottomAppBar(),
          body: WillPopScope(
            child: controller.mypages.elementAt(controller.current),
            onWillPop: () {
              return controller.exetfromapp(context);
            },
          ),
        );
      },
    );
  }
}
