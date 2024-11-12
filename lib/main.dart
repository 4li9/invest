import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/login_screen.dart';
import 'package:invest/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      routes: routes,
    );
  }
}
