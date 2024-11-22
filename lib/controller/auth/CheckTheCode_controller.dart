// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class CheckTheCodeController extends GetxController {
  // ignore: non_constant_identifier_names
  CheckTheCode();
  goToCreatePassword();
}

class CheckTheCodeControllerimp extends CheckTheCodeController {
  @override
  // ignore: non_constant_identifier_names
  CheckTheCode() {}

  @override
  goToCreatePassword() {
    Get.toNamed(AppRoute.CreatePassword);
  }
}
