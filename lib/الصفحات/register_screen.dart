import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:invest/controller/auth/RegisterScreen_controller%20copy.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController inviterIDController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إنشاء حساب'),
        centerTitle: true,
        leading: IconButton(
          // زر الرجوع
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // يرجع إلى الشاشة السابقة
          },
        ),
        backgroundColor: const Color(0xFF0D1B2A),
      ),
      backgroundColor: const Color(0xFF0D1B2A),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              controller: emailController,
              labelText: 'البريد الإلكتروني',
              icon: Icons.email,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: phoneController,
              labelText: 'رقم الهاتف',
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: fullNameController,
              labelText: 'الاسم الكامل',
              icon: Icons.person,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: passwordController,
              labelText: 'كلمة المرور',
              icon: Icons.lock,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: inviterIDController,
              labelText: 'معرف المدعو',
              icon: Icons.person_add,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _showLoadingDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'تسجيل',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.amber),
        filled: true,
        fillColor: Colors.black54,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    RegisterScreenControllerimp controller =
        Get.put(RegisterScreenControllerimp());

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.black54,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'جاري إنشاء حساب',
                style: TextStyle(color: Colors.amber, fontSize: 18),
              ),
              const SizedBox(height: 16),
              const CircularProgressIndicator(color: Colors.amber),
            ],
          ),
        ),
      ),
    );

    // تأخير لمدة 5 ثوانٍ
    Timer(const Duration(seconds: 5), () {
      Navigator.pop(context); // إغلاق نافذة الانتظار
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إنشاء الحساب')),
      );
      controller.goToHomeScreen();
    });
  }
}
