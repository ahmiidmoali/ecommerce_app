import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/translatedatabase%20copy.dart';
import 'package:flutter/material.dart';

class PricePresItemDetails extends StatelessWidget {
  final String price;
  const PricePresItemDetails({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    ArabicNumbers arabicNumber = ArabicNumbers();
    return Row(
      children: [
        Text(
          translateDataBase("EGP ", ""),
          style: const TextStyle(
            height: 1,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        Text(
          translateDataBase(price, arabicNumber.convert(price)),
          style: const TextStyle(
              fontFamily: "sans",
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor),
        ),
        Text(
          translateDataBase("", " جنية "),
          style: const TextStyle(
            height: 1,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}

class PriceDisItemDetails extends StatelessWidget {
  final String price;
  const PriceDisItemDetails({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    ArabicNumbers arabicNumber = ArabicNumbers();
    return Row(
      children: [
        Text(
          translateDataBase("      ", ""),
          style: const TextStyle(
            height: 1,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        Text(
          translateDataBase(price, arabicNumber.convert(price)),
          style: const TextStyle(
            fontFamily: "sans",
            height: 2,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            decorationColor: Colors.black,
            decoration: TextDecoration.lineThrough,
            color: Colors.red,
          ),
        ),
        Text(
          translateDataBase("", "          "),
          style: const TextStyle(
            height: 1,
            color: Colors.black,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}

class PriceCoPresItemDetails extends StatelessWidget {
  final String price;
  final Color? color;
  final double? fontSize;
  const PriceCoPresItemDetails(
      {super.key,
      required this.price,
      required this.color,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    ArabicNumbers arabicNumber = ArabicNumbers();
    return Row(
      children: [
        Text(
          translateDataBase("EGP ", ""),
          style: TextStyle(
            height: 1,
            color: color,
            fontSize: fontSize,
          ),
        ),
        Text(
          translateDataBase(price, arabicNumber.convert(price)),
          style: TextStyle(
              fontFamily: "sans",
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: color),
        ),
        Text(
          translateDataBase("", " جنية "),
          style: TextStyle(
            height: 1,
            color: color,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}

class PriceCartPresItemDetails extends StatelessWidget {
  final String price;
  final double fontSizesmall;
  final double fontSizebig;
  const PriceCartPresItemDetails(
      {super.key,
      required this.price,
      required this.fontSizesmall,
      required this.fontSizebig});

  @override
  Widget build(BuildContext context) {
    ArabicNumbers arabicNumber = ArabicNumbers();
    return Row(
      children: [
        Text(
          translateDataBase("EGP ", ""),
          style: TextStyle(
            height: 1,
            color: Colors.black,
            fontSize: fontSizesmall,
          ),
        ),
        Text(
          translateDataBase(price, arabicNumber.convert(price)),
          style: TextStyle(
              fontFamily: "sans",
              fontSize: fontSizebig,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor),
        ),
        Text(
          translateDataBase("", " جنية "),
          style: TextStyle(
            height: 1,
            color: Colors.black,
            fontSize: fontSizesmall,
          ),
        ),
      ],
    );
  }
}
