import 'package:flutter/material.dart';
import 'package:invest/الصفحات/CheckTheCode.dart'; // استيراد صفحة CheckTheCode لصفحة التحقق من الكود
import 'package:invest/الصفحات/DepositScreen.dart';
import 'package:invest/الصفحات/NewSupportScreen.dart';
import 'package:invest/الصفحات/ProfileScreen.dart';
import 'package:invest/الصفحات/TeamMembersScreen.dart';
import 'package:invest/الصفحات/home_screen.dart';
import 'package:invest/الصفحات/login_screen.dart';
import 'package:invest/الصفحات/register_screen.dart';
import 'package:invest/الصفحات/withdraw_screen.dart';
import 'package:invest/core/constant/app_routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.WithdrawScreen: (context) => WithdrawScreen(),
  AppRoute.TeamMembersScreen: (context) => TeamMembersScreen(),
  AppRoute.RegisterScreen: (context) => RegisterScreen(),
  AppRoute.ProfileScreen: (context) => ProfileScreen(),
  AppRoute.NewSupportScreen: (context) => NewSupportScreen(),
  AppRoute.LoginScreen: (context) => LoginScreen(),
  AppRoute.HomeScreen: (context) => HomeScreen(),
  AppRoute.DepositScreen: (context) => DepositScreen(),
  AppRoute.CheckTheCode: (context) =>
      CheckTheCode(), // إضافة مسار CheckTheCode لربط المسار بصفحة التحقق من الكود
};
