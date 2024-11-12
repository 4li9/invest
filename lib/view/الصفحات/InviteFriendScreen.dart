import 'package:flutter/material.dart';
import 'package:invest/view/widget/auth/BackgroundWrapper%20.dart';

class InviteFriendScreen extends StatelessWidget {
  const InviteFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('دعوة صديق', style: TextStyle(color: Colors.white)),
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
                'شارك التطبيق',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'ادعو أصدقاءك للاستفادة من التطبيق عن طريق إدخال بريدهم الإلكتروني أو رقم الهاتف أدناه:',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              // حقل إدخال البريد الإلكتروني أو رقم الهاتف
              TextField(
                decoration: InputDecoration(
                  hintText: 'أدخل البريد الإلكتروني أو رقم الهاتف',
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
              // زر دعوة
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // تنفيذ الإجراء عند الضغط على زر الدعوة
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                  ),
                  child: const Text(
                    'دعوة',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // زر مشاركة الرابط
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    // تنفيذ الإجراء عند الضغط على زر مشاركة الرابط
                  },
                  icon: const Icon(Icons.share, color: Colors.black),
                  label: const Text(
                    'مشاركة الرابط',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber, // لون الزر
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
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
