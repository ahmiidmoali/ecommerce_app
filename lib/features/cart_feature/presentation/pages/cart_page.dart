import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/validinput.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/widgets/custom_toast.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/data/models/cart_order_dto.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/cart_entity.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/domain/entities/coupon_entity.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/cart_order/cart_order_cubit.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/control/cart_control_cubit.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/coupon/coupon_cubit.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/view/cart_cubit.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/widgets/cartbottomnavigatorbar.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/widgets/cartitemscard.dart';
import 'package:enhanced_ecommerce_app/features/checkout_feature/presentation/pages/ship_to_page.dart';
import 'package:enhanced_ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_feature/const/sharedkeys.dart';
import '../../../app_feature/global/widgets/global_loading_screen.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String userId = sharedPreferences.getString(AppSharedKeys.id) ?? "";
  GlobalKey<FormState>? _formstate = GlobalKey<FormState>();
  List<CartEntity> cartItems = [];
  int countitems = 0;
  CouponEntity coupon = CouponEntity();
  TextEditingController? couponController;
  late FocusNode _textFieldFocusNode;
  String? couponname;
  int coupondiscount = 0;
  double totalprice = 0;
  int totalitems = 0;
  double totalpriceCheckout = 0;

  bool couponDone = false;
  String? couponid;
  double totalPriceSum(List<CartEntity> items) {
    totalitems = items.length;
    double totalSum = 0;
    for (var i = 0; i < items.length; i++) {
      totalSum = totalSum + items[i].itemsprice! + 0.0;
    }
    print(totalSum);
    totalprice = totalSum;
    return totalSum;
  }

  double totalpriceequation() {
    totalpriceCheckout = (totalprice - totalprice * coupondiscount / 100);
    return totalpriceCheckout;
  }

  applyCoupon() {
    var formdata = _formstate!.currentState;
    if (formdata!.validate()) {
      BlocProvider.of<CouponCubit>(context).checkCoupon(couponController!.text);
    }
  }

  checkout() {
    if (cartItems.isEmpty) {
      CustomToast.show("the cart is not empty");
      return;
    }
    BlocProvider.of<CartOrderCubit>(context).addItems(
        cart: cartItems,
        coupon: coupon,
        totalPrice: totalprice,
        totalPriceAfterCharges: totalpriceCheckout);
    // Navigator.of(context).pushNamed(AppRoute.checkout);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ShipToPage(),
    ));
  }

  @override
  void initState() {
    couponController = TextEditingController();
    _textFieldFocusNode = FocusNode();
    BlocProvider.of<CartViewCubit>(context).viewCartItems(userId);

    super.initState();
  }

  @override
  void dispose() {
    _formstate = null;
    couponController!.dispose();
    _textFieldFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
            title: const Text(
              "Your cart",
              style: TextStyle(color: AppColor.black, fontSize: 25),
            ),
            elevation: 0,
            backgroundColor: AppColor.background,
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColor.black,
                ))),
        bottomNavigationBar: BlocBuilder<CouponCubit, CouponState>(
          builder: (context, state) {
            if (state is CouponLoaded) {
              final coupon = state.coupon;
              this.coupon = state.coupon;
              coupondiscount = coupon.couponDiscount ?? 0;
            }
            if (state is Couponfailed) {
              coupon = CouponEntity();
              coupondiscount = 0;
            }
            return BlocBuilder<CartViewCubit, CartViewState>(
              buildWhen: (previous, current) {
                if (current is CartViewLoaded && previous != current) {
                  return true;
                } else {
                  return false;
                }
              },
              builder: (context, state) {
                if (state is CartViewLoaded) {
                  final cartItems = state.cartItems;
                  this.cartItems = cartItems;
                  return Form(
                    key: _formstate,
                    child: CustomCartBottomNavigatorBar(
                        itemsCount: cartItems.length,
                        validator: (p0) {
                          return validInput(p0!, 1, 100, "coupon");
                        },
                        placeOrder: () {
                          checkout();
                        },
                        couponDone: couponDone,
                        discount: "${(coupondiscount)} %",
                        couponController: couponController,
                        focusNode: _textFieldFocusNode,
                        onPressedCoupon: () {
                          applyCoupon();
                        },
                        onTapOutside: (p0) {
                          if (_textFieldFocusNode.hasFocus) {
                            _textFieldFocusNode.unfocus();
                          }
                        },
                        price:
                            " ${totalPriceSum(cartItems).toStringAsFixed(0)}",
                        totalPrice:
                            " ${(totalpriceequation().toStringAsFixed(0))} "),
                  );
                } else {
                  return const SizedBox();
                }
              },
            );
          },
        ),
        body: BlocConsumer<CartControlCubit, CartControlState>(
          listener: (context, state) {
            // if (state is CartAddSuccess || state is CartRemoveSuccess) {
            //   BlocProvider.of<CartViewCubit>(context).viewCartItems(userId);
            // }
          },
          builder: (context, state) {
            return BlocBuilder<CartViewCubit, CartViewState>(
              builder: (context, state) {
                if (state is CartViewLoading) {
                  return const GlobalLoadingScreen();
                }
                if (state is CartViewLoaded) {
                  final cartItems = state.cartItems;
                  if (cartItems.isEmpty) {
                    return const Center(
                      child: Text("no items"),
                    );
                  }
                  totalPriceSum(cartItems);
                  totalitems = cartItems.length;
                  return ListView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItems.length,
                    // controller.data.length,
                    itemBuilder: (context, index) => CustomCartItemsCard(
                      addbutton: () {
                        BlocProvider.of<CartControlCubit>(context).addCartItems(
                            userId,
                            cartItems[index].itemsId.toString(),
                            context);
                      },
                      removebutton: () {
                        BlocProvider.of<CartControlCubit>(context)
                            .removeCartItems(userId,
                                cartItems[index].itemsId.toString(), context);
                      },
                      cart: cartItems[index],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("no data"),
                  );
                }
              },
            );
          },
        ));
  }
}
