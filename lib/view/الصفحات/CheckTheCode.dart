import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest/controller/auth/CheckTheCode_controller.dart';

class CheckTheCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ربط الـ Controller بالواجهة
    CheckTheCodeControllerimp controller = Get.put(CheckTheCodeControllerimp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // الرجوع للصفحة السابقة
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verify your email',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'A 6-digit code has been sent to import.code9@gmail.com. '
                'Please enter it within the next 30 minutes.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Verification Code',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (value) {
                        controller
                            .validateCode(value); // التحقق عند إدخال الكود
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () {
                      controller.sendCode(); // استدعاء إرسال الكود
                    },
                    child: Text(
                      'Get Code',
                      style: TextStyle(color: Colors.orange, fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              // عرض رسالة الخطأ باستخدام Obx
              Obx(() => Text(
                    controller.errorMessage.value, // عرض رسالة الخطأ
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  )),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    controller
                        .goToCreatePassword(); // الانتقال عند الضغط على الزر
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    controller.sendCode(); // نفس الإجراء عند الضغط على النص
                  },
                  child: Text(
                    "Didn't receive the code?",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
