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
    throw UnimplementedError();
  }
  
  @override
  gotoInviteFriendScreen() {
    Get.toNamed(AppRoute.InviteFriendScreen);
    throw UnimplementedError();
  }
  
  @override
  gotoTeamMembersScreen() {
    Get.toNamed(AppRoute.TeamMembersScreen);
    throw UnimplementedError();
  }
  
  @override
  gotoWithdrawScreen() {
    Get.toNamed(AppRoute.WithdrawScreen);
    throw UnimplementedError();
  }
}
