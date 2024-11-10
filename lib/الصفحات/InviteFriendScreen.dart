import 'package:flutter/material.dart';

class InviteFriendScreen extends StatelessWidget {
  const InviteFriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('دعوة صديق', style: TextStyle(color: Colors.white)),
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
              'شارك التطبيق',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'ادعو أصدقاءك للاستفادة من التطبيق عن طريق إدخال بريدهم الإلكتروني أو رقم الهاتف أدناه:',
              style: TextStyle(
                color: Colors.grey[300],
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            // حقل إدخال البريد الإلكتروني أو رقم الهاتف
            TextField(
              decoration: InputDecoration(
                hintText: 'أدخل البريد الإلكتروني أو رقم الهاتف',
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
            // زر دعوة
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // تنفيذ الإجراء عند الضغط على زر الدعوة
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // لون الزر
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'دعوة',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 30),
            // زر مشاركة الرابط
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // تنفيذ الإجراء عند الضغط على زر مشاركة الرابط
                },
                icon: Icon(Icons.share, color: Colors.black),
                label: Text(
                  'مشاركة الرابط',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, // لون الزر
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
