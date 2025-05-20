import 'package:easy_localization/easy_localization.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/alertexitapp.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/validinput.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/widgets/navigator_utils.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/home_screen/view/homescreen.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/log_in/log_in_cubit.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/verify_sign/verify_sign_up_cubit.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/pages/forget_password/check_email_page.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/pages/sign_up_page.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/pages/verify_code_sign_up_page.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/custom_button_auth.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/custom_text_body_auth.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/custom_text_form_field_auth.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/custom_text_log_in_and_sign_up.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/custom_text_title_auth.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/logo_auth_image.dart';
import 'package:enhanced_ecommerce_app/generated/locale_keys.g.dart';
import 'package:enhanced_ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_feature/global/widgets/custom_toast.dart';
import '../../../app_feature/global/widgets/global_loading_screen.dart';
import '../widgets/log_in_widgets/custom_password_text_form_field_auth.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  GlobalKey<FormState>? _formstateLoginIn = GlobalKey<FormState>();
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  logIn() {
    var formdata = _formstateLoginIn!.currentState;
    if (formdata!.validate()) {
      BlocProvider.of<LogInCubit>(context)
          .login(emailTextController.text, passwordTextController.text);
    }
  }

  @override
  void initState() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailTextController.clear();
    passwordTextController.clear();
    _formstateLoginIn = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          onWillPop: () {
            return alertExitApp(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Form(
              key: _formstateLoginIn,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const LogoAuthAssetImage(),
                  CustomTextTitleAuth(
                      text: LocaleKeys.login_page_welcomeToMyApp.tr()),
                  CustomTextBodyAuth(
                      // title: "12"
                      //     .tr//"Sign in with your email and password\nor continue with social media"
                      title: LocaleKeys
                          .login_page_signInWithYourEmailAndPassword
                          .tr()),
                  const SizedBox(
                    height: 65,
                  ),
                  CustomTextFormAuth(
                      isNumber: false,
                      vaild: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                      myController: emailTextController,
                      // lable: "13".tr, //"Email"
                      // hint: "14".tr, //"Enter your email"
                      lable: LocaleKeys.login_page_email.tr(),
                      hint: LocaleKeys.login_page_enterYourEmail.tr(),
                      icon: Icons.email_outlined),
                  CustomPasswordTextFormFieldAuth(
                      isNumber: false,
                      vaild: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      myController: passwordTextController,
                      // lable: "15".tr, //"Password"
                      // hint: "16".tr, //"Enter your Password"
                      lable: LocaleKeys.login_page_password.tr(),
                      hint: LocaleKeys.login_page_enteryourPassword.tr(),
                      icon: Icons.lock_outlined),
                  InkWell(
                    onTap: () {
                      pushScreen(context, const CheckEmailFPPage());
                    },
                    child: Text(
                      // "17".tr, // "Forget Password"
                      LocaleKeys.login_page_forgetPassword.tr(),
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<LogInCubit, LogInState>(
                    listener: (context, state) {
                      if (state is LogInLoaded) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false,
                        );
                      }
                      if (state is LogInEmailNotVerified) {
                        BlocProvider.of<VerifySignUpCubit>(context)
                            .resendCode(state.email);
                        pushScreen(
                            context,
                            VerifyCodeSignUpPage(
                              email: state.email,
                            ));
                      }
                      if (state is LogInFailure) {
                        CustomToast.show(
                            "the email or password is not correct");
                      }
                    },
                    builder: (context, state) {
                      // print(state);
                      if (state is LogInLoading) {
                        return const SizedBox(
                            width: 40,
                            height: 40,
                            child: GlobalLoadingScreen());
                      }

                      return CustomButtonAuth(
                        text: LocaleKeys.login_page_signIn.tr(),
                        onPressed: () {
                          logIn();
                        },
                      );
                    },
                  ),
                  CustomTextLoginSignUp(
                      onTap: () {
                        pushScreen(context, const SignUpPage());
                      },
                      text1: LocaleKeys.login_page_doNotHaveAnAccount.tr(),
                      text2: LocaleKeys.login_page_signUp.tr())
                ],
              ),
            ),
          )),
    );
  }
}
