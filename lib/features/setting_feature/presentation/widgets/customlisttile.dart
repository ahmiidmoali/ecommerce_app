import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:flutter/material.dart';

class CustomProfileListTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onpress;

  const CustomProfileListTile(
      {super.key,
      required this.title,
      required this.onpress,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.white,
          ),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 30,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              )
            ],
          )),
    );
  }
}
