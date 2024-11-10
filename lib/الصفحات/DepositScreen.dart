import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const depositAddress = 'TWMxcsK9j7UYMYyYUhL9u5y3fHM6dND8H4';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'إيداع',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF0D1B2A),
      ),
      backgroundColor: const Color(0xFF0D1B2A),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اختيار العملة
            const Text(
              'العملة',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: 'Tether USDT',
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                dropdownColor: Colors.black87,
                underline: Container(),
                style: const TextStyle(color: Colors.white),
                items: <String>['Tether USDT', 'Bitcoin', 'Ethereum']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // تنفيذ كود تغيير العملة
                },
              ),
            ),
            const SizedBox(height: 20),

            // إدخال العنوان
            const Text(
              'العنوان',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SelectableText(
                      depositAddress,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, color: Colors.amber),
                    onPressed: () {
                      Clipboard.setData(
                          const ClipboardData(text: depositAddress));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('تم نسخ العنوان')),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // اختيار الشبكة
            const Text(
              'الشبكة',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                value: 'TRC20',
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                dropdownColor: Colors.black87,
                underline: Container(),
                style: const TextStyle(color: Colors.white),
                items: <String>['TRC20', 'ERC20', 'BEP20']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // تنفيذ كود تغيير الشبكة
                },
              ),
            ),
            const SizedBox(height: 20),

            // الحد الأدنى للمبلغ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'USD الحد الأدنى لمبلغ الإيداع:',
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    '10',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // زر الإيداع
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // تنفيذ كود الإيداع
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'إيداع',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
