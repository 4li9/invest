import 'package:flutter/material.dart';
import 'app_routes.dart'; // استيراد ملف المسارات

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide the debug banner

      title: 'Registration App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: AppRoutes.getRoutes(), // استدعاء المسارات من الملف الجديد
    );
  }
}
