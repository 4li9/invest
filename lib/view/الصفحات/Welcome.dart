import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest/view/widget/auth/Navigation%20bar.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool? hasInviter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(); // العودة للصفحة السابقة
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40), // لإعطاء مساحة في الأعلى
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome aboard!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Do you have an inviter? (Optional)",
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: const Text('Yes'),
                    selected: hasInviter == true,
                    onSelected: (selected) {
                      setState(() {
                        hasInviter = true;
                      });
                    },
                    selectedColor: Colors.white,
                    labelStyle: TextStyle(
                      color: hasInviter == true ? Colors.black : Colors.grey,
                      fontWeight: hasInviter == true
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    side: BorderSide(
                      color: hasInviter == true ? Colors.black : Colors.grey,
                      width: 1,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: const Text('No'),
                    selected: hasInviter == false,
                    onSelected: (selected) {
                      setState(() {
                        hasInviter = false;
                      });
                    },
                    selectedColor: Colors.white,
                    labelStyle: TextStyle(
                      color: hasInviter == false ? Colors.black : Colors.grey,
                      fontWeight: hasInviter == false
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    side: BorderSide(
                      color: hasInviter == false ? Colors.black : Colors.grey,
                      width: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (hasInviter == true) ...[
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Referral ID',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
              if (hasInviter != null) // زر يظهر فقط عند اختيار Yes أو No
                ElevatedButton(
                  onPressed: () {
                    _showLoadingDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20), // مساحة إضافية في الأسفل
            ],
          ),
        ),
      ),
    );
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop();
          _navigateToHome(); // الانتقال إلى الصفحة الرئيسية بعد تحميل البيانات
        });
        return AlertDialog(
          content: Row(
            children: const [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text("Loading..."),
            ],
          ),
        );
      },
    );
  }

  void _navigateToHome() {
    Get.to(
      Navigation_Bar(),
    );
    _showSuccessMessage(); // عرض رسالة نجاح
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("تم إنشاء الحساب بنجاح"),
        backgroundColor: Colors.green,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
