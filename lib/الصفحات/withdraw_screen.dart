import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color(0xFF1B1B2F), // تغيير لون الخلفية ليتماشى مع التصميم السابق
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('سحب'),
        centerTitle: true,
        leading: IconButton(
          // زر الرجوع
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // يرجع إلى الشاشة السابقة
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              // تنفيذ كود المساعدة هنا
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // اختيار العملة
            const Text('العملة', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tether USDT', style: TextStyle(color: Colors.white)),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // إدخال العنوان
            const Text('العنوان', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: 'أدخل أو اضغط مع الاستمرار للصق عنوان السحب',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.black54,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // اختيار الشبكة
            const Text('الشبكة', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TRC20', style: TextStyle(color: Colors.white)),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // إدخال الكمية
            const Text('الكمية', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الحد الأدنى لمبلغ السحب: 10 USD',
                      style: TextStyle(color: Colors.amber)),
                  Icon(Icons.add, color: Colors.amber),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // زر السحب
            ElevatedButton(
              onPressed: () {
                // تنفيذ كود السحب هنا
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.amber,
              ),
              child: Text('سحب', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
