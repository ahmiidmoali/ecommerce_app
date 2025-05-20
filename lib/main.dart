import 'package:enhanced_ecommerce_app/features/app_feature/const/sharedkeys.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/home_screen/view/cubit/screen_page_cubit.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/home_screen/view/homescreen.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/welcome_page/view/page/language_page.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/cart_order/cart_order_cubit.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/control/cart_control_cubit.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/view/cart_cubit.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/presentation/bloc/coupon/coupon_cubit.dart';
import 'package:enhanced_ecommerce_app/features/checkout_feature/presentation/cubit/address_cud/address_cud_cubit.dart';
import 'package:enhanced_ecommerce_app/features/checkout_feature/presentation/cubit/address_view/address_view_cubit.dart';
import 'package:enhanced_ecommerce_app/features/checkout_feature/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/favourite/favourite_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/home/home_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/item_details/item_details_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/items/items_cubit.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/presentation/cubit/search_items/search_items_cubit.dart';
import 'package:enhanced_ecommerce_app/features/order_feature/presentation/bloc/order_get_details/order_get_details_cubit.dart';
import 'package:enhanced_ecommerce_app/features/order_feature/presentation/bloc/order_view/order_view_cubit.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/forget_password/reset_password/reset_password_cubit.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/log_in/log_in_cubit.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/welcome_page/controller/wlecome_controller.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/verify_sign/verify_sign_up_cubit.dart';
import 'package:enhanced_ecommerce_app/generated/codegen_loader.g.dart';
import 'package:enhanced_ecommerce_app/routes/on_generate_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/user_feature/presentation/cubit/forget_password/check_email/check_email_cubit.dart';
import 'features/user_feature/presentation/cubit/forget_password/verify_code_f_p/verify_code_f_p_cubit.dart';
import 'main_injection_container.dart' as di;
import 'package:easy_localization/easy_localization.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await di.init();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [const Locale('en'), const Locale('ar')],
        assetLoader: const CodegenLoader(),
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //app feature
        BlocProvider(
          create: (context) => ScreenPageCubit(),
        ),
        BlocProvider(
          create: (context) => WelcomePageBloc(),
        ),
        //user feature----------------------------
        BlocProvider(
          create: (context) => di.sl<LogInCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<SignUpCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<VerifySignUpCubit>(),
        ),
        //forget-password
        BlocProvider(
          create: (context) => di.sl<ResetPasswordCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<CheckEmailCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<VerifyCodeFPCubit>(),
        ),
        //home feature----------------------------
        BlocProvider(
          create: (context) => di.sl<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<ItemsCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<ItemDetailsCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<SearchItemsCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<FavouriteCubit>(),
        ),
        //cart feature----------------------------
        BlocProvider(
          create: (context) => di.sl<CartViewCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<CouponCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<CartControlCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<CartOrderCubit>(),
        ),
        //checkout feature----------------------------
        BlocProvider(
          create: (context) => di.sl<CheckoutCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<AddressCudCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<AddressViewCubit>(),
        ),
        //order feature----------------------------
        BlocProvider(
          create: (context) => di.sl<OrderViewCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<OrderGetDetailsCubit>(),
        ),
        //new feature----------------------------
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: OnGenerateRoutes.route,
        routes: {
          "/": (BuildContext context) {
            if (sharedPreferences.getString(AppSharedKeys.id) != null) {
              return const HomeScreen();
            } else {
              return const LanguagePage();
            }
          }
        },
      ),
    );
  }
}
