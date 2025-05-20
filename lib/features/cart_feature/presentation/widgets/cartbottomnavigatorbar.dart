import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/translatedatabase%20copy.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/widgets/customprice_pres_itemdetails.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/coupon/coupon_cubit.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/widgets/customcartbottomsheetbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customcouponbotton.dart';

class CustomCartBottomNavigatorBar extends StatelessWidget {
  final String price;
  final String? Function(String?)? validator;
  final int itemsCount;
  final FocusNode? focusNode;
  final bool couponDone;
  final String discount;

  final Function()? placeOrder;
  final Function(PointerDownEvent)? onTapOutside;
  final String totalPrice;
  final TextEditingController? couponController;
  final Function()? onPressedCoupon;

  const CustomCartBottomNavigatorBar(
      {super.key,
      required this.price,
      required this.totalPrice,
      this.couponController,
      this.onPressedCoupon,
      required this.discount,
      this.onTapOutside,
      required this.couponDone,
      required this.placeOrder,
      this.focusNode,
      this.validator,
      required this.itemsCount});

  @override
  Widget build(BuildContext context) {
    ArabicNumbers arabicNumber = ArabicNumbers();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16)
          .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CouponCubit, CouponState>(
              builder: (context, state) {
                if (state is CouponLoaded) {
                  final coupon = state.coupon;

                  return Text(
                    coupon.couponName ?? "",
                    style: const TextStyle(
                        fontSize: 25,
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  );
                } else {
                  return Column(
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 2,
                              child: TextFormField(
                                validator: validator,
                                onTapOutside: onTapOutside,
                                focusNode: focusNode,
                                controller: couponController,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    isDense: true,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                              )),
                          state is CouponLoading
                              ? const Expanded(
                                  flex: 1, child: Text("Loading....."))
                              : Expanded(
                                  flex: 1,
                                  child: CustomButtonCoupon(
                                    title: "apply",
                                    onPressed: onPressedCoupon,
                                  ),
                                ),
                        ],
                      ),
                      if (state is Couponfailed)
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "* Your Coupon Is Not Correct ",
                            style: TextStyle(color: Colors.red, fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                        )
                    ],
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "items($itemsCount)",
                  style: const TextStyle(color: AppColor.grey1, fontSize: 18),
                ),
                const Spacer(),
                PriceCoPresItemDetails(
                  fontSize: 20,
                  price: price,
                  color: AppColor.black,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "discount",
                  style: TextStyle(color: AppColor.grey1, fontSize: 18),
                ),
                const Spacer(),
                Text(
                  translateDataBase(discount, arabicNumber.convert(discount)),
                  style: const TextStyle(color: AppColor.black, fontSize: 20),
                ),
              ],
            ),
            const Divider(thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Total Price",
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                PriceCartPresItemDetails(
                  fontSizebig: 21,
                  fontSizesmall: 18,
                  price: totalPrice,
                )
              ],
            ),
            CustomCartBottomSheetButton(
              title: "Check Out",
              onPressed: placeOrder,
            )
          ],
        ),
      ),
    );
  }
}
