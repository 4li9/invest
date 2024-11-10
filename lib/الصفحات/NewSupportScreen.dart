import 'package:flutter/material.dart';

class NewSupportScreen extends StatelessWidget {
  const NewSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الدعم الفني', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF1B1B2F), // لون الخلفية الداكنة
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تواصل معنا',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'نحن هنا لمساعدتك. الرجاء تعبئة النموذج أدناه للتواصل معنا.',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            // حقل اسم المستخدم
            TextField(
              decoration: InputDecoration(
                hintText: 'ُEnter yor email ',
                hintStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                fillColor: Color(0xFF162447), // خلفية داكنة للحقل
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            // حقل الرسالة
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: ' Whats your problem ? ',
                hintStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                fillColor: Color(0xFF162447), // خلفية داكنة للحقل
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            // زر الإرسال
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // تنفيذ الإجراء عند الضغط على زر الإرسال
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // لون الزر
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'إرسال',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
