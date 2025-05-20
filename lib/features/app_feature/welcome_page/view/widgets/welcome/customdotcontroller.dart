import 'package:enhanced_ecommerce_app/features/app_feature/const/on_boarding_list.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/welcome_page/controller/wlecome_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomePageBloc, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                  margin: const EdgeInsets.only(right: 5),
                  // width: controller.currentpage == index ? 12 : 6,
                  width: BlocProvider.of<WelcomePageBloc>(context)
                              .getcurrentPage ==
                          index
                      ? 12
                      : 6,
                  height: 6,
                  decoration: BoxDecoration(
                      // color: AppColor.primaryColor,
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5)),
                  duration: const Duration(microseconds: 900))),
        );
      },
    );
  }
}
