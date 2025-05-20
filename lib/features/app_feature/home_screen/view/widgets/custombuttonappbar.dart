import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final String name;
  final IconData? iconData;
  final void Function()? onPressed;
  final bool colorCase;
  const CustomButtonAppBar(
      {super.key,
      required this.name,
      this.iconData,
      this.onPressed,
      required this.colorCase});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: colorCase == true ? AppColor.primaryColor : AppColor.grey2,
          ),
          Text(
            name,
            style: TextStyle(
              color: colorCase == true ? AppColor.primaryColor : AppColor.grey2,
            ),
          )
        ],
      ),
    );
  }
}
