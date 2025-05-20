import 'package:easy_localization/easy_localization.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/global/widgets/navigator_utils.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/home_screen/view/homescreen.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/welcome_page/view/page/welcome_page.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/widgets/log_in_widgets/logo_auth_image.dart';
import 'package:enhanced_ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../const/appcolor.dart';
import '../../../const/sharedkeys.dart';
import '../widgets/language/custom_buttom_lang.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  chooseArabic(String lang) {
    if (context.locale != Locale(lang)) {
      context.setLocale(Locale(lang));
    }
    if (sharedPreferences.getString(AppSharedKeys.id) != null) {
      pushReplaceAllScreens(context, const HomeScreen());
    } else {
      pushScreen(context, const WelcomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoAuthAssetImage(),
            Text(
              LocaleKeys.language_page_chooseLanguage.tr(),
              style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(),
            customButtonLang(
              title: LocaleKeys.language_page_arabic.tr(),
              onPressed: () {
                chooseArabic("ar");
              },
            ),
            customButtonLang(
              title: LocaleKeys.language_page_english.tr(),
              onPressed: () {
                chooseArabic("en");
              },
            )
          ],
        ),
      ),
    );
  }
}
