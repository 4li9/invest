import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class LoginScreenController extends GetxController {
  // تعريف الطرق المجردة
  LoginScreen();
  goToNavigation_Bar();
  goToRegisterScreen();
  goToCheckTheCodeScreen(); // إضافة الطريقة الجديدة
}

class LoginScreenControllerimp extends LoginScreenController {
  @override
  // تعريف البناء الفارغ
  LoginScreen() {}

  @override
  goToNavigation_Bar() {
    Get.toNamed(AppRoute.Navigation_Bar);
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
