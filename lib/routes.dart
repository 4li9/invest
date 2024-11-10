
import 'package:flutter/material.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/DepositScreen.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/InviteFriendScreen.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/NewSupportScreen.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/ProfileScreen.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/TeamMembersScreen.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/home_screen.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/login_screen.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/register_screen.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/withdraw_screen.dart';
import 'package:invest/core/constant/app_routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.WithdrawScreen: (context) => WithdrawScreen(),
  AppRoute.TeamMembersScreen: (context) => TeamMembersScreen(),
  AppRoute.RegisterScreen: (context) => RegisterScreen(),
  AppRoute.ProfileScreen: (context) => ProfileScreen(),
  AppRoute.NewSupportScreen: (context) => NewSupportScreen(),
  AppRoute.LoginScreen: (context) => LoginScreen(),
  AppRoute.InviteFriendScreen: (context) => InviteFriendScreen(),
  AppRoute.HomeScreen: (context) => HomeScreen(),
  AppRoute.DepositScreen: (context) => DepositScreen(),

};
