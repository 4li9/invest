import 'package:flutter/material.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String fullName = "Import.Code"; // الاسم الرباعي للمستخدم
  final String email = "usgfgfer@example.com"; // البريد الإلكتروني
  final String username = "@import_code9"; // يوزر المستخدم على التطبيق

  ImageProvider<Object> profileImage =
      AssetImage('assets/images/profile_picture.jpg'); // صورة الملف الشخصي

  // دالة لتغيير صورة الملف الشخصي
  Future<void> _changeProfileImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = FileImage(File(pickedFile.path));
      });
    }
  }

  // دالة لإخفاء جزء من البريد الإلكتروني
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
    return Scaffold(
      backgroundColor: Colors.white, // تغيير الخلفية إلى الأبيض
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black), // تغيير لون الأيقونات إلى الأسود
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // يرجع إلى الشاشة السابقة
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.black), // أيقونة القلم للتعديل
            onPressed: () {
              // وظيفة تعديل الملف الشخصي
            },
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert,
                color: Colors.black), // أيقونة الثلاث نقاط
            color: Colors.grey[200], // لون خلفية القائمة
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // إضافة حواف مستديرة
            ),
            onSelected: (String value) {
              // الإجراءات التي تحدث عند اختيار عنصر من القائمة
              switch (value) {
                case 'edit_info':
                  // وظيفة تعديل معلومات الملف الشخصي
                  break;
                case 'change_language':
                  // وظيفة تغيير لغة التطبيق
                  break;
                case 'change_password':
                  // وظيفة تغيير كلمة المرور
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'edit_info',
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // محاذاة الأيقونة لليمين
                  children: [
                    Text(
                      'تعديل معلومات الملف',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.edit, color: Colors.black54), // أيقونة القلم
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'change_language',
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // محاذاة الأيقونة لليمين
                  children: [
                    Text(
                      'تغيير لغة التطبيق',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.language, color: Colors.black54), // أيقونة اللغة
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'change_password',
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.end, // محاذاة الأيقونة لليمين
                  children: [
                    Text(
                      'تغيير كلمة المرور',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.lock, color: Colors.black54), // أيقونة القفل
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // المحاذاة إلى اليمين
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _changeProfileImage,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: profileImage, // الصورة القابلة للتغيير
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      style: TextStyle(
                        color: Colors.black, // تغيير لون النص إلى الأسود
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
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
            SizedBox(height: 30),
            // صندوق معلومات المستخدم
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey[200], // خلفية الحقول باللون الرمادي الفاتح
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.end, // المحاذاة إلى اليمين
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
            ),
            SizedBox(height: 20),
            // صندوق تغيير كلمة المرور وتسجيل الخروج
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey[200], // خلفية الحقول باللون الرمادي الفاتح
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.end, // المحاذاة إلى اليمين
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
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[100], // اللون الرمادي الفاتح للخلفية
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.black54, // لون النص الرمادي الفاتح
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.black, // لون النص الأسود
                    fontSize: 16,
                  ),
                ),
              ],
            ),
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey[100], // اللون الرمادي الفاتح للخلفية
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.black, // لون النص الأسود
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
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
