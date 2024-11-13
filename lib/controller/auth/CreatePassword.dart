import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class CreatePasswordController extends GetxController {
  CreatePassword();
  goToWelcome();
}

class CreatePasswordControllerimp extends CreatePasswordController {
  @override
  CreatePassword() {}

  @override
  goToWelcome() {
    Get.toNamed(AppRoute.Welcome);
  }
}
