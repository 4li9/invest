import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String userId = "12345"; // ID الخاص بالمستخدم
  final String fullName = "أحمد محمد علي"; // اسم المستخدم

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الملف الشخصي',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'الاسم الكامل: $fullName',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'ID الخاص بك: $userId',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
