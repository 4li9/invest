import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest/core/constant/app_routes.dart';

abstract class CheckTheCodeController extends GetxController {
  // دالة للتحقق من الكود
  void validateCode(String inputCode);

  // الانتقال إلى صفحة إنشاء كلمة المرور
  void goToCreatePassword();

  // إرسال رمز الكود
  void sendCode();
}

class CheckTheCodeControllerimp extends CheckTheCodeController {
  // رسالة الخطأ
  var errorMessage = ''.obs;

  get code => null;

  @override
  void validateCode(String inputCode) {
    // تحقق من صحة الكود
    if (inputCode == "123456") {
      // الكود الصحيح
      errorMessage.value = ''; // مسح رسالة الخطأ
      goToCreatePassword(); // الانتقال إلى الصفحة التالية
    } else {
      errorMessage.value = 'رمز الكود خاطئ'; // عرض رسالة الخطأ
    }
  }

  @override
  void goToCreatePassword() {
    Get.toNamed(AppRoute.CreatePassword);
  }

  @override
  void sendCode() {
    // عرض رسالة Snackbar عند إرسال الكود
    Get.snackbar(
      'تم الإرسال',
      'تم إرسال رمز الكود بنجاح',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
  }
}
