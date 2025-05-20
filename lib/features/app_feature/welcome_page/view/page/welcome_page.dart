import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/welcome_page/controller/wlecome_controller.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/welcome_page/view/widgets/welcome/custombutton.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/welcome_page/view/widgets/welcome/customdotcontroller.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/welcome_page/view/widgets/welcome/customslider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(OnBoardingControllerImp());
    return Scaffold(
      // backgroundColor: AppColor.background,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: SafeArea(
                child: CustomSliderOnBoarding(
              pageController: pageController,
            )),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                const CustomDotControllerOnBoarding(),
                const SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          // Get.back();
                        },
                        icon: const Icon(
                          Icons.language_outlined,
                          color: AppColor.primaryColor,
                        )),
                    CustomButtonOnBoarding(
                      onPressed: () {
                        BlocProvider.of<WelcomePageBloc>(context).next(
                            context: context, pageController: pageController);
                      },
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
