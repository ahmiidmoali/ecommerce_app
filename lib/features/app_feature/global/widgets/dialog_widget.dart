import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

displayAlertDialog(BuildContext context,
    {required VoidCallback onTap,
    required String confirmTitle,
    required String content}) {
  // set up the button

  Widget cancelButton = TextButton(
    child: const Text("Cancel", style: TextStyle(color: AppColor.primaryColor)),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget deleteButton = TextButton(
    onPressed: onTap,
    child: Text(confirmTitle,
        style: const TextStyle(color: AppColor.primaryColor)),
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColor.primaryColor,
    content:
        Text(content, style: const TextStyle(color: AppColor.primaryColor)),
    actions: [cancelButton, deleteButton],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
