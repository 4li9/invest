import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class LoginScreenController extends GetxController {
  LoginScreen();
  goToHomeScreen();
  goToRegisterScreen();
  goToCheckTheCodeScreen(); // إضافة الدالة الجديدة للانتقال إلى CheckTheCode
}

class LoginScreenControllerimp extends LoginScreenController {
  @override
  LoginScreen() {}

  @override
  goToHomeScreen() {
    Get.toNamed(AppRoute.HomeScreen);
  }

  @override
  goToRegisterScreen() {
    Get.toNamed(AppRoute.RegisterScreen);
  }

  @override
  goToCheckTheCodeScreen() {
    Get.toNamed(AppRoute.CheckTheCode); // استدعاء المسار الخاص بـ CheckTheCode
  }
}
