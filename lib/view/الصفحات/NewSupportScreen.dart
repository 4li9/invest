import 'package:flutter/material.dart';
import 'package:invest/view/widget/auth/BackgroundWrapper%20.dart';

class NewSupportScreen extends StatelessWidget {
  const NewSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title:
              const Text('الدعم الفني', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            // زر الرجوع
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // يرجع إلى الشاشة السابقة
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'تواصل معنا',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'نحن هنا لمساعدتك. الرجاء تعبئة النموذج أدناه للتواصل معنا.',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              // حقل اسم المستخدم
              TextField(
                decoration: InputDecoration(
                  hintText: 'ُEnter yor email ',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: const Color(0xFF162447), // خلفية داكنة للحقل
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // حقل الرسالة
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: ' Whats your problem ? ',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: const Color(0xFF162447), // خلفية داكنة للحقل
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // زر الإرسال
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // تنفيذ الإجراء عند الضغط على زر الإرسال
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    'إرسال',
                    style: TextStyle(color: Colors.black, fontSize: 18),
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
