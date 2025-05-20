import 'package:enhanced_ecommerce_app/features/app_feature/global/functions/validinput.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/widgets/custom_toast.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/widgets/global_loading_screen.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/widgets/navigator_utils.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/domain/entities/user_entity.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/pages/verify_code_sign_up_page.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/custom_button_auth.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/custom_password_text_form_field_auth.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/custom_text_body_auth.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/custom_text_form_field_auth.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/custom_text_title_auth.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/logo_auth_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_feature/global/functions/alertexitapp.dart';
import '../widgets/log_in_widgets/custom_text_log_in_and_sign_up.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState>? _formstateSignIn = GlobalKey<FormState>();
  late TextEditingController userNameTextController;
  late TextEditingController mobileTextController;
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  bool isShowedText = true;
  changeShowedText() {
    isShowedText = isShowedText == true ? false : true;
  }

  signUp() {
    var formdata = _formstateSignIn!.currentState;
    if (formdata!.validate()) {
      BlocProvider.of<SignUpCubit>(context).signUp(UserEntity(
          usersName: userNameTextController.text,
          usersEmail: emailTextController.text,
          usersPhone: mobileTextController.text,
          usersPassword: passwordTextController.text));
    }
  }

  @override
  void initState() {
    userNameTextController = TextEditingController();
    mobileTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    userNameTextController.clear();
    mobileTextController.clear();
    emailTextController.clear();
    passwordTextController.clear();
    _formstateSignIn = null;
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
                key: _formstateSignIn,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const LogoAuthAssetImage(),
                    const CustomTextTitleAuth(text: "Let’s Get Started"),
                    const CustomTextBodyAuth(title: "Create an new account"),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormAuth(
                        isNumber: false,
                        vaild: (val) {
                          return validInput(val!, 5, 12, "username");
                        },
                        myController: userNameTextController,
                        lable: "Username",
                        //  .tr, "Username"
                        hint: "Enter your Username",
                        //  .tr, "Enter your Username"
                        icon: Icons.person_2_outlined),
                    CustomTextFormAuth(
                        isNumber: false,
                        vaild: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        myController: emailTextController,
                        lable: "Email",
                        //    .tr, "Email"
                        hint: "Enter your email",
                        // .tr, "Enter your email"
                        icon: Icons.email_outlined),
                    CustomTextFormAuth(
                        isNumber: true,
                        vaild: (val) {
                          return validInput(val!, 7, 20, "mobile");
                        },
                        myController: mobileTextController,
                        lable: "Mobile",
                        hint: "Enter your numbe",
                        icon: Icons.phone_android_outlined),
                    CustomPasswordTextFormFieldAuth(
                        isNumber: false,
                        vaild: (val) {
                          return validInput(val!, 5, 13, "password");
                        },
                        myController: passwordTextController,
                        lable: "Password", //"Password"
                        hint: "Enter your Password",
                        icon: Icons.lock_outlined),
                    const SizedBox(
                      height: 30,
                    ),
                    BlocConsumer<SignUpCubit, SignUpState>(
                      listener: (context, state) {
                        if (state is SignUpSuccess) {
                          pushScreen(
                              context,
                              VerifyCodeSignUpPage(
                                email: emailTextController.text,
                              ));
                        }
                        if (state is SignUpFailed) {
                          CustomToast.show("email or phone is used");
                        }
                      },
                      builder: (context, state) {
                        if (state is SignUpILoading) {
                          return const SizedBox(
                              width: 40,
                              height: 40,
                              child: GlobalLoadingScreen());
                        }
                        return CustomButtonAuth(
                          text: "Sign Up",
                          onPressed: () {
                            signUp();
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextLoginSignUp(
                        onTap: () {
                          pop(context);
                        },
                        text1: "have an account?",
                        text2: "Sign In")
                  ],
                ),
              ),
            )));
  }
}
