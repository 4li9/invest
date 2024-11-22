import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest/controller/auth/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginScreenControllerimp controller = Get.put(LoginScreenControllerimp());

    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A), // Dark background color
      body: Stack(
        children: [
          // Fullscreen Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/iPhone 16 Pro Max - 3.png', // Replace with your image asset path
              fit: BoxFit.cover, // Fit image to cover the full screen
            ),
          ),
          // Dark Overlay to match DepositScreen background
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Login Buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      controller.goToHomeScreen();
                    },
                    icon: const Icon(
                      Icons
                          .g_mobiledata, // يمكنك استبدال الأيقونة بأيقونة جوجل مناسبة
                      size: 30,
                      color: Colors
                          .red, // لون الأيقونة ليكون أقرب لألوان شعار جوجل
                    ),
                    label: const Text('تسجيل دخول بواسطة جوجل'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  // Text instead of TextButton
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              controller.goToRegisterScreen();
                            },
                            child: const Text(
                              'سجل الآن',
                              style: TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration
                                    .underline, // إضافة خط أسفل الكلمة
                              ),
                            ),
                          ),
                        ),
                        const TextSpan(
                          text: ' ليس لديك حساب؟',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
