import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest/controller/auth/RegisterScreen_controller.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterScreenControllerimp controller =
      Get.put(RegisterScreenControllerimp());
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Get.back(); // العودة للصفحة السابقة
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Binance',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email/Phone number',
                  hintText: 'Email/Phone (without country code)',
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // لون النص داخل الإطار عند التركيز
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(
                          255, 0, 0, 0), // لون الإطار عند التركيز
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    checkColor: const Color.fromARGB(255, 255, 255, 255),
                    activeColor: Colors.yellow[700],
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "By creating an account, I agree to Binance's Terms of Service and Privacy Policy.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
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
                    controller.goToCheckTheCode();
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
