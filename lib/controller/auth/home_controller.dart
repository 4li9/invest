import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class HomeScreenController extends GetxController {
  // ignore: non_constant_identifier_names
  HomeScreen();
  goToProfileScreen();
  gotoNewSupportScreen();
  gotoDepositScreen();
  gotoWithdrawScreen();
  gotoInviteFriendScreen();
  gotoTeamMembersScreen();
}

class HomeScreenControllerimp extends HomeScreenController {
  @override
  // ignore: non_constant_identifier_names
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
  gotoInviteFriendScreen() {
    Get.toNamed(AppRoute.InviteFriendScreen);
  }

  @override
  gotoTeamMembersScreen() {
    Get.toNamed(AppRoute.TeamMembersScreen);
  }

  @override
  gotoWithdrawScreen() {
    Get.toNamed(AppRoute.WithdrawScreen);
  }
}
