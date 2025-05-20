import 'package:enhanced_ecommerce_app/main.dart';

translateDataBase(columnen, columnar) {
  // MyServices myServices = Get.find();
  if (sharedPreferences.getString("lang") == "ar") {
    return columnar;
  } else {
    return columnen;
  }
}
