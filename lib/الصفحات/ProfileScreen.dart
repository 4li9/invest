import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1B2F), // خلفية داكنة
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الملف الشخصي',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // وظيفة زر التعديل على الملف الشخصي
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/profile_picture.jpg'), // ضع صورة البروفايل هنا
            ),
            SizedBox(height: 10),
            Text(
              'MOHAMMED.78.1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'البريد الإلكتروني: user@example.com',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Divider(color: Colors.grey[700]),
            SizedBox(height: 20),
            _buildProfileOption(Icons.person, 'تغيير الاسم', () {
              // وظيفة تغيير الاسم
            }),
            _buildProfileOption(Icons.email, 'تغيير البريد الإلكتروني', () {
              // وظيفة تغيير البريد الإلكتروني
            }),
            _buildProfileOption(Icons.lock, 'تغيير كلمة المرور', () {
              // وظيفة تغيير كلمة المرور
            }),
            _buildProfileOption(Icons.language, 'تغيير اللغة', () {
              // وظيفة تغيير اللغة
            }),
            _buildProfileOption(Icons.logout, 'تسجيل الخروج', () {
              // وظيفة تسجيل الخروج
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
      onTap: onTap,
    );
  }
}
