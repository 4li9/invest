// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class RegisterScreenController extends GetxController {
  // ignore: non_constant_identifier_names
  RegisterScreen();
  goToHomeScreen();
   goToCheckTheCode();


}

class RegisterScreenControllerimp extends RegisterScreenController {
  @override
  // ignore: non_constant_identifier_names
  RegisterScreen() {}

  @override
  goToHomeScreen() {
    Get.toNamed(AppRoute.HomeScreen);
  }
  
  @override
  goToCheckTheCode() {
    Get.toNamed(AppRoute.CheckTheCode);

  }

  
}
