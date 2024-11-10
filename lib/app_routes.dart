import 'package:flutter/material.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/DepositScreen.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/InviteFriendScreen.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/NewSupportScreen.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/ProfileScreen.dart';
import 'package:invest/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/TeamMembersScreen.dart';
import 'الصفحات/login_screen.dart';
import 'الصفحات/register_screen.dart';
import 'الصفحات/home_screen.dart';
import 'الصفحات/withdraw_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => LoginScreen(),
      '/register': (context) => RegisterScreen(),
      '/home': (context) => HomeScreen(),
      '/withdraw': (context) => WithdrawScreen(),
      '/deposit': (context) => DepositScreen(),
      '/support': (context) => NewSupportScreen(),
      '/invite': (context) => InviteFriendScreen(),
      '/team': (context) => TeamMembersScreen(),
      '/profile': (context) => ProfileScreen(),
    };
  }
}
