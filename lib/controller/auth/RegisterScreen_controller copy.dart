import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class RegisterScreenController extends GetxController {
  RegisterScreen();
  goToHomeScreen();
  goToCheckTheCodeScreen(); // إضافة دالة للانتقال إلى صفحة CheckTheCode
}

class RegisterScreenControllerimp extends RegisterScreenController {
  @override
  RegisterScreen() {}

  @override
  goToHomeScreen() {
    Get.toNamed(AppRoute.HomeScreen);
  }

  @override
  goToCheckTheCodeScreen() {
    Get.toNamed(AppRoute.CheckTheCode); // الانتقال إلى صفحة التحقق من الكود
// التنقل إلى صفحة CheckTheCode باستخدام المسار
  }
}
