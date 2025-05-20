// import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
// import 'package:flutter/material.dart';

// class CustomColorItemsDetails extends StatelessWidget {
//   final List<Color?> color;
//   const CustomColorItemsDetails({super.key, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         ...List.generate(
//            color.length,
//             (index) => Container(
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.only(right: 10, left: 10),
//                   height: 70,
//                   width: 100,
//                   decoration: BoxDecoration(
//                       color: color[index]["active"] == 0
//                           ? AppColor.white
//                           : AppColor.Blueblack,
//                       border: Border.all(width: 2),
//                       borderRadius: BorderRadius.circular(20)),
//                   child: Text(
//                     color[index]["name"],
//                     style: TextStyle(
//                         color: color[index]["active"] == 0
//                             ? AppColor.Blueblack
//                             : AppColor.white,
//                         height: 1,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ))
//       ],
//     );
//   }
// }
