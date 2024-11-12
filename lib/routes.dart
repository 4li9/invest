import 'package:flutter/material.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/CheckTheCode.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/DepositScreen.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/InviteFriendScreen.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/NewSupportScreen.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/ProfileScreen.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/TeamMembersScreen.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/home_screen.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/login_screen.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/register_screen.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/withdraw_screen.dart';
import 'package:invest/core/constant/app_routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.WithdrawScreen: (context) => const WithdrawScreen(),
  AppRoute.TeamMembersScreen: (context) => TeamMembersScreen(),
  AppRoute.RegisterScreen: (context) => RegisterScreen(),
  AppRoute.ProfileScreen: (context) => const ProfileScreen(),
  AppRoute.NewSupportScreen: (context) => const NewSupportScreen(),
  AppRoute.LoginScreen: (context) => const LoginScreen(),
  AppRoute.InviteFriendScreen: (context) => const InviteFriendScreen(),
  AppRoute.HomeScreen: (context) => const HomeScreen(),
  AppRoute.DepositScreen: (context) => const DepositScreen(),
    AppRoute.CheckTheCode: (context) =>  CheckTheCode(),

};
