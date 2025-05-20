import 'package:enhanced_ecommerce_app/features/app_feature/const/routes.dart';
import 'package:enhanced_ecommerce_app/features/checkout_feature/presentation/pages/checkout_page.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/presentation/pages/log_in_page.dart';
import 'package:enhanced_ecommerce_app/features/app_feature/welcome_page/view/page/welcome_page.dart';
import 'package:flutter/material.dart';

class OnGenerateRoutes {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;
    switch (name) {
      case AppRoute.welcomePage:
        {
          return materialPageBuilder(const WelcomePage());
        }
      case AppRoute.login:
        {
          return materialPageBuilder(const LogInPage());
        }
    }
    return materialPageBuilder(const ErrorPage());
  }
}

dynamic materialPageBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: const Center(
        child: Text("Error"),
      ),
    );
  }
}
