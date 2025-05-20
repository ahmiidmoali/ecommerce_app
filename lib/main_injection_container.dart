import 'package:enhanced_ecommerce_app/features/app_feature/global/services/network_services.dart';
import 'package:enhanced_ecommerce_app/features/cart_feature/cart_injection_container.dart';
import 'package:enhanced_ecommerce_app/features/checkout_feature/checkout_injection_container.dart';
import 'package:enhanced_ecommerce_app/features/home_feature/home_injection_container.dart';
import 'package:enhanced_ecommerce_app/features/order_feature/order_injection_container.dart';
import 'package:enhanced_ecommerce_app/features/user_feature/user_injection_container.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton<NetworkServices>(
    () => NetworkServicesImp(),
  );
  await userInjectionContainer();
  await homeInjectionContainer();
  await cartInjectionContainer();
  await checkoutInjectionContainer();
  await orderInjectionContainer();
}
