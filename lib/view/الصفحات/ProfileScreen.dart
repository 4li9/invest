import 'package:flutter/material.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String fullName = "Import.Code";
  final String email = "usgfgfer@example.com";
  final String username = "@import_code9";

  ImageProvider<Object> profileImage =
      AssetImage('assets/images/profile_picture.jpg');

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
    return username.substring(0, visiblePart) +
        '*' * (username.length - visiblePart) +
        '@' +
        domain;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black),
            onPressed: () {
              // وظيفة تعديل الملف الشخصي
            },
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.black),
            color: Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onSelected: (String value) {
              switch (value) {
                case 'edit_info':
                  break;
                case 'change_language':
                  break;
                case 'change_password':
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'edit_info',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'تعديل معلومات الملف',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.edit, color: Colors.black54),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'change_language',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'تغيير لغة التطبيق',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.language, color: Colors.black54),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'change_password',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'تغيير كلمة المرور',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.lock, color: Colors.black54),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _changeProfileImage,
                  child: CircleAvatar(
                    radius: screenWidth * 0.1,
                    backgroundImage: profileImage,
                  ),
                ),
                SizedBox(width: screenWidth * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "متصل",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            _buildSection(
              context,
              children: [
                _buildProfileRow(
                  icon: Icons.person,
                  label: "اسم المستخدم",
                  value: fullName,
                ),
                Divider(color: Colors.grey),
                _buildProfileRow(
                  icon: Icons.email,
                  label: "البريد الإلكتروني",
                  value: _obscureEmail(email),
                ),
                Divider(color: Colors.grey),
                _buildProfileRow(
                  icon: Icons.alternate_email,
                  label: "يوزر المستخدم",
                  value: username,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            _buildSection(
              context,
              children: [
                _buildOptionRow(
                  icon: Icons.lock,
                  label: "تغيير كلمة المرور",
                  onTap: () {
                    // وظيفة تغيير كلمة المرور
                  },
                ),
                Divider(color: Colors.grey),
                _buildOptionRow(
                  icon: Icons.logout,
                  label: "تسجيل الخروج",
                  onTap: () {
                    // وظيفة تسجيل الخروج
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            "$label: $value",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionRow({
    required IconData icon,
    required String label,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, {required List<Widget> children}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: children,
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
