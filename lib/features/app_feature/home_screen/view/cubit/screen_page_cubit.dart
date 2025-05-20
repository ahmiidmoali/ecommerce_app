import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/display_alert_dialog.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/pages/home_page.dart';
import 'package:enhanced_ecommerce_app/features/setting_feature/presentation/pages/setting_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'screen_page_state.dart';

class ScreenPageCubit extends Cubit<ScreenPageState> {
  ScreenPageCubit() : super(ScreenPageInitial());
  int current = 0;

  changePage(i) {
    if (current == i) {
      return;
    }
    current = i;
    emit(ScreenPageSwitchPages(current: current));
  }

  List<Widget> mypages = [
    const HomePage(),
    const Center(child: Text("notificationsPage")),
    const SettingPage(),
    const Center(child: Text("offersPage"))
  ];
  List<String> appbarname = [
    "home",
    "notifica",
    "Settings",
    "offers"
  ]; //"home", "notifica", "Settings", "offers"
  List iconsList = [
    Icons.home_outlined,
    Icons.notifications_active_outlined,
    Icons.settings_outlined,
    Icons.local_offer_outlined
  ];
  exetfromapp(BuildContext context) {
    displayAlertDialog(context, onTap: () {
      exit(0);
    }, confirmTitle: "", content: "Do you want to");
    return Future.value(false);
  }
}
