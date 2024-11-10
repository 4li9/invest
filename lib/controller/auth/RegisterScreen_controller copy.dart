import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class RegisterScreenController extends GetxController {
  RegisterScreen();
  goToHomeScreen();
 

}

class RegisterScreenControllerimp extends RegisterScreenController {
  @override
  RegisterScreen() {}

  @override
  goToHomeScreen() {
    Get.toNamed(AppRoute.HomeScreen);
  }

  
}
