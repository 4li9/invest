import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const depositAddress = 'TNGCHfqcYQszxNiep9cPrcG99XuvhDKdC5';
    const network = 'Tron (TRC20)';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TRC20 إيداع ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.black),
            onPressed: () {
              // Add camera functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.black),
            onPressed: () {
              // Add info functionality here
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Image.network(
                'https://example.com/qr-code-image.png',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.swap_horiz, color: Colors.grey),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'الشبكة',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            network,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(height: 20, thickness: 1),
                  Row(
                    children: [
                      const Icon(Icons.account_balance_wallet,
                          color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'عنوان الإيداع',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            SelectableText(
                              depositAddress,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy, color: Colors.grey),
                        onPressed: () {
                          Clipboard.setData(
                              const ClipboardData(text: depositAddress));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم نسخ العنوان'),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'المزيد من التفاصيل',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add save and share functionality here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 235, 59, 1),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'رفع ملف الايداع',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
