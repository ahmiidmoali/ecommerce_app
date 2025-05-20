import 'dart:io';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/display_alert_dialog.dart';
import 'package:flutter/material.dart';

Future<bool> alertExitApp(BuildContext context) {
  displayAlertDialog(
    confirmTitle: "Alert",
    context,
    content: "Do you want to exit from the app?",
    onTap: () {
      exit(0);
    },
  );
  return Future.value(true);
}
