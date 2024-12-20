// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class WelcomeController extends GetxController {
  // ignore: non_constant_identifier_names
  Welcome();
  goToNavigation_Bar();
}

class WelcomeControllerimp extends WelcomeController {
  @override
  // ignore: non_constant_identifier_names
  Welcome() {}

  @override
  goToNavigation_Bar() {
    Get.toNamed(AppRoute.Navigation_Bar);
  }
}
