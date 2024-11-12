import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class HomeScreenController extends GetxController {
  HomeScreen();
  goToProfileScreen();
  gotoNewSupportScreen();
  gotoDepositScreen();
  gotoWithdrawScreen();
  gotoTeamMembersScreen();
}

class HomeScreenControllerimp extends HomeScreenController {
  @override
  HomeScreen() {}

  @override
  goToProfileScreen() {
    Get.toNamed(AppRoute.ProfileScreen);
  }

  @override
  gotoNewSupportScreen() {
    Get.toNamed(AppRoute.NewSupportScreen);
  }

  @override
  gotoDepositScreen() {
    Get.toNamed(AppRoute.DepositScreen);
  }

  @override
  gotoTeamMembersScreen() {
    Get.toNamed(AppRoute.TeamMembersScreen);
  }

  @override
  gotoWithdrawScreen() {
    Get.toNamed(AppRoute.WithdrawScreen);
  }

  void changeLanguage() {}

  void changePassword() {}
}
