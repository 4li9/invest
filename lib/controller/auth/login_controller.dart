import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class LoginScreenController extends GetxController {
  // تعريف الطرق المجردة
  LoginScreen();
  goToHomeScreen();
  goToRegisterScreen();
  goToCheckTheCodeScreen(); // إضافة الطريقة الجديدة
}

class LoginScreenControllerimp extends LoginScreenController {
  @override
  // تعريف البناء الفارغ
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
    Get.toNamed(
        AppRoute.CheckTheCode); // تأكد من أن AppRoute يحتوي على CheckTheCode
  }
}
