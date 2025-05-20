// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "language_page": {
    "chooseLanguage": "اختر اللغة",
    "arabic": "عربي",
    "english": "انجليزي"
  },
  "login_page": {
    "welcomeToMyApp": "مرحبا بك في تطبيقي",
    "signInWithYourEmailAndPassword": "تسجيل الدخول بالبريد الالكتروني وكلمة المرور",
    "email": "البريد الالكتروني",
    "enterYourEmail": "ادخل البريد الالكتروني",
    "password": "كلمة المرور",
    "enteryourPassword": "ادخل كلمة المرور",
    "forgetPassword": "نسيت كلمة المرور",
    "signIn": "تسجيل الدخول",
    "doNotHaveAnAccount": "ليس لديك حساب؟",
    "signUp": "انشاء حساب"
  }
};
static const Map<String,dynamic> _en = {
  "language_page": {
    "chooseLanguage": "Choose Language",
    "arabic": "Arabic",
    "english": "English"
  },
  "login_page": {
    "welcomeToMyApp": "Welcome to MyApp",
    "signInWithYourEmailAndPassword": "Sign in with your email and password",
    "email": "Email",
    "enterYourEmail": "Enter your email",
    "password": "Password",
    "enteryourPassword": "Enter your Password",
    "forgetPassword": "Forget Password",
    "signIn": "Sign In",
    "doNotHaveAnAccount": "Don't have an account?",
    "signUp": "Sign Up"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
