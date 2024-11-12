import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:invest/core/constant/app_routes.dart';
import 'package:invest/controller/auth/RegisterScreen_controller%20copy.dart';

class CheckTheCode extends StatelessWidget {
  final TextEditingController emailOrPhoneController = TextEditingController();

  CheckTheCode({super.key});

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Binance',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: emailOrPhoneController,
              labelText: 'Email/Phone number',
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    _isChecked = value ?? false;
                  },
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'By creating an account, I agree to Binance\'s ',
                      style: TextStyle(color: Colors.black54),
                      children: [
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isChecked
                    ? () => _showLoadingDialog(context)
                    : null, // Disable button if checkbox is not checked
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Sign up as an entity ',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: 'or ',
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextSpan(
                      text: 'Log in',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
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
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.black),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    RegisterScreenControllerimp controller =
        Get.put(RegisterScreenControllerimp());

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Creating account...',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              const SizedBox(height: 16),
              const CircularProgressIndicator(color: Colors.yellow),
            ],
          ),
        ),
      ),
    );

    Timer(const Duration(seconds: 5), () {
      Navigator.pop(context); // Close loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Account created')),
      );
      Get.toNamed(AppRoute.CheckTheCode); // الانتقال إلى صفحة التحقق من الكود
});
}
}