import 'package:enhanced_ecommerce_app/features/app_feature/const/appcolor.dart';
import 'package:enhanced_ecommerce_app/features/order_feature/presentation/pages/order_pending_page.dart';
import 'package:enhanced_ecommerce_app/features/setting_feature/presentation/widgets/customlisttile.dart';

import 'package:enhanced_ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSwitch = true;
    //    getisswitch() {
    //   if (myServices.sharedPreferences.getBool("isswitchprofile") == true) {
    //     isswitch = true;
    //   } else {
    //     isswitch = false;
    //   }
    // }

    logOut() {
      // String userid = sharedPreferences.getString(AppSharedKeys.id)!;
      // FirebaseMessaging.instance.unsubscribeFromTopic("users");
      // FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
      sharedPreferences.clear();
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/",
        (route) => false,
      );
    }

    return Container(
      color: AppColor.background,
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Account", // "Notification"
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            width: 250,
            child: ListTile(
              leading: const Text(
                "Notification", // "Notification"
                style: TextStyle(fontSize: 20),
              ),
              trailing: Switch(
                value: isSwitch,
                onChanged: (value) {
                  // updateswitch(value);
                },
              ),
            ),
          ),
          const Divider(),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                // CustomProfileListTile(
                //     title: "Archive",
                //     onpress: () {},
                //     icon: Icons.article_sharp),
                CustomProfileListTile(
                    title: "Profile", //"language"
                    onpress: () {
                      // Get.toNamed(AppRoute.language);
                    },
                    icon: Icons.person),
                CustomProfileListTile(
                    title: "language", //"language"
                    onpress: () {
                      // Get.toNamed(AppRoute.language);
                    },
                    icon: Icons.language_outlined),
                CustomProfileListTile(
                    title: "Orders", //"Orders"
                    onpress: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OrderPendingPage(),
                      ));
                    },
                    icon: Icons.article_sharp),
                CustomProfileListTile(
                    title: "Adress", //"Adress"
                    onpress: () {
                      // Get.toNamed(AppRoute.addressview);
                    },
                    icon: Icons.house_outlined),
                CustomProfileListTile(
                    title: "About Us", //"About Us"
                    onpress: () {},
                    icon: Icons.help_outline_outlined),
                CustomProfileListTile(
                    title: "Contact Us", //"Contact Us"
                    onpress: () {
                      launchUrl(Uri.parse("tel:+1-555-010-999"));
                    },
                    icon: Icons.phone),
                CustomProfileListTile(
                    title: "Log Out", // "Log Out"
                    onpress: () {
                      logOut();
                    },
                    icon: Icons.logout_outlined),
              ],
            ),
          )
        ],
      ),
    );
  }
}
