import 'package:enhanced_ecommerce_app/features/app_feature/const/on_boarding_list.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/const/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePageBloc extends Cubit<int> {
  WelcomePageBloc() : super(0);

  set setcurrentPage(int currentPage) {
    emit(currentPage);
  }

  int get getcurrentPage => state;

  next({required BuildContext context, required pageController}) {
    emit(state + 1);
    if (state == onBoardingList.length) {
      Navigator.of(context).pushNamed(AppRoute.login);
    } else {
      pageController.animateToPage(state,
          duration: Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }
}
