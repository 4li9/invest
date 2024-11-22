import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class RegisterScreenController extends GetxController {
  goToHomeScreen();
  goToCheckTheCodeScreen();
  // ignore: non_constant_identifier_names
  RegisterScreen();
  goToCheckTheCode();
}

class RegisterScreenControllerimp extends RegisterScreenController {
  @override
  goToHomeScreen() {
    Get.toNamed(AppRoute.HomeScreen);
  }

  @override
  goToCheckTheCodeScreen() {
    Get.toNamed(AppRoute.CheckTheCode);
  }

  // ignore: non_constant_identifier_names
  RegisterScreen() {}

  @override
  goToCheckTheCode() {
    Get.toNamed(AppRoute.CheckTheCode);
  }
}
