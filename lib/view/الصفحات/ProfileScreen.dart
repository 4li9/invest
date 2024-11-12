import 'package:flutter/material.dart';
import 'dart:io';

import 'package:invest/view/widget/auth/BackgroundWrapper%20.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String fullName = "Import.Code";
  final String email = "user@example.com";
  final String username = "@import_code9";

  ImageProvider<Object> profileImage =
      const AssetImage('assets/images/profile_picture.jpg');

  Future<void> _changeProfileImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = FileImage(File(pickedFile.path));
      });
    }
  }

  String _obscureEmail(String email) {
    final parts = email.split('@');
    final username = parts[0];
    final domain = parts[1];
    final visiblePart = username.length ~/ 2;
    return '${username.substring(0, visiblePart)}${'*' * (username.length - visiblePart)}@$domain';
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
              color: Colors.black), // تغيير لون الأيقونات إلى الأسود
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit,
                  color: Colors.black), // تغيير الأيقونة إلى الأسود
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _changeProfileImage,
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: profileImage,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullName,
                        style: const TextStyle(
                          color: Colors.black, // تغيير لون النص إلى الأسود
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "متصل",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildFieldContainer("اسم المستخدم", fullName, Icons.person),
              const SizedBox(height: 15),
              _buildFieldContainer(
                  "البريد الإلكتروني", _obscureEmail(email), Icons.email),
              const SizedBox(height: 15),
              _buildFieldContainer(
                  "يوزر المستخدم", username, Icons.alternate_email),
              const SizedBox(height: 30),
              _buildOptionContainer(
                label: "تغيير كلمة المرور",
                icon: Icons.lock,
                onTap: () {},
              ),
              const SizedBox(height: 15),
              _buildOptionContainer(
                label: "تسجيل الخروج",
                icon: Icons.logout,
                onTap: () {},
              ),
              const SizedBox(height: 15),
              _buildOptionContainer(
                label: "تغيير اللغة",
                icon: Icons.language,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldContainer(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300], // تغيير لون الخلفية إلى الرمادي الفاتح
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black54, // لون النص الرمادي الداكن
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black, // لون النص الأسود
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionContainer({
    required String label,
    required IconData icon,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[300], // تغيير لون الخلفية إلى الرمادي الفاتح
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.black, // لون النص الأسود
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSource {
  static var gallery;
}

class ImagePicker {
  pickImage({required source}) {}
}
