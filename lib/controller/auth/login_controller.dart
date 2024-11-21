import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class LoginScreenController extends GetxController {
  // ignore: non_constant_identifier_names
  LoginScreen();
  goToNavigation_Bar();
  goToRegisterScreen();
}

class LoginScreenControllerimp extends LoginScreenController {
  @override
  // ignore: non_constant_identifier_names
  LoginScreen() {}

  @override
  goToNavigation_Bar() {
    Get.toNamed(AppRoute.Navigation_Bar);
  }

  @override
  goToRegisterScreen() {
    Get.toNamed(AppRoute.RegisterScreen);
  }
}
