import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/const/image_assets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String hinttext;
  final TextEditingController? mycontroller;
  final Function(String)? onchanged;

  final void Function()? onpressnofic;
  final void Function()? onpressfavourite;
  const CustomAppBar({
    super.key,
    required this.hinttext,
    this.onpressnofic,
    required this.onpressfavourite,
    required this.onchanged,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Image.asset(
              AppImageAssetConsts.newlogo,
              color: AppColor.primaryColor,
              fit: BoxFit.fill,
              height: 50,
              width: 50,
            ),
          ),
          Expanded(
              child: TextFormField(
            controller: mycontroller,
            onChanged: onchanged,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: hinttext,
              hintStyle: const TextStyle(fontSize: 18, height: 1),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.black),
                  borderRadius: BorderRadius.circular(10)),
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
                onPressed: onpressfavourite,
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.grey[600],
                  size: 35,
                )),
          )
        ],
      ),
    );
  }
}
