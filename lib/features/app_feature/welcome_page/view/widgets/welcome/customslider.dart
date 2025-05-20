import 'package:enhanced_ecommerce_app/features/app_feature/const/on_boarding_list.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/welcome_page/controller/wlecome_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSliderOnBoarding extends StatelessWidget {
  final PageController pageController;
  const CustomSliderOnBoarding({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: (value) {
        BlocProvider.of<WelcomePageBloc>(context).setcurrentPage = value;
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) {
        return Column(children: [
          const SizedBox(
            height: 1,
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            onBoardingList[index].image!,
            height: MediaQuery.of(context).size.width / 1.3,
            fit: BoxFit.fill,
          ),
          Text(onBoardingList[index].title!,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  // color: AppColor.black
                  color: Colors.black)),
          const SizedBox(
            height: 10,
          ),
          Text(
            onBoardingList[index].body!,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 2,
                // color: AppColor.grey
                color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
        ]);
      },
    );
  }
}
