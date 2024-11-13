import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/home_screen.dart';

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
            Get.back(); // هذا السطر يقوم بالعودة للصفحة السابقة
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              "Welcome aboard!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Do you have an inviter? (Optional)",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: Text('Yes'),
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
                SizedBox(width: 10),
                ChoiceChip(
                  label: Text('No'),
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
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Referral ID',
                filled: true,
                fillColor: Colors.grey[200],
                enabled: hasInviter == true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 40),
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
          ],
        ),
      ),
    );
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop();
          _navigateToHome(); // الانتقال إلى الصفحة الرئيسية بعد تحميل البيانات
        });
        return AlertDialog(
          content: Row(
            children: [
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
      HomeScreen(),
    );
    _showSuccessMessage(); // عرض رسالة نجاح
  }

  // عرض رسالة تأكيد عند إنشاء الحساب بنجاح
  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("تم إنشاء الحساب بنجاح"),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(10)), // تعديل الحواف المنحنية
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
