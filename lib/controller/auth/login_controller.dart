import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class LoginScreenController extends GetxController {
  // ignore: non_constant_identifier_names
  LoginScreen();
  goToHomeScreen();
  goToCheckTheCode();
}

class LoginScreenControllerimp extends LoginScreenController {
  @override
  // ignore: non_constant_identifier_names
  LoginScreen() {}

  @override
  goToHomeScreen() {
    Get.toNamed(AppRoute.HomeScreen);
  }

  @override
  goToCheckTheCode() {
    Get.toNamed(AppRoute.CheckTheCode);
  }
}
