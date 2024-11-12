import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class RegisterScreenController extends GetxController {
  goToHomeScreen();
  goToCheckTheCodeScreen();
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
}
