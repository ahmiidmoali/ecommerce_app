import 'package:flutter/material.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  final Function()? onPressed;
  const CustomButtonOnBoarding({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            // color: AppColor.primaryColor,
            color: Colors.green,
            borderRadius: BorderRadius.circular(10)),
        width: 280,
        height: 40,
        child: const Text(
          // "9-1".tr, // "Continue"
          "Continue",
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
