import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1B2F), // خلفية داكنة
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('مرحباً بك'),
        centerTitle: true,
        actions: [
          // أيقونة الملف الشخصي في الجهة اليمنى من الشريط العلوي
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.account_circle, size: 36, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // اسم المستخدم
            Text(
              'MOHAMMED.78.1',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // مساحة لوضع الصورة بحجم أكبر يشبه بطاقة ائتمان
            Center(
              child: Container(
                height: 200, // ارتفاع أكبر ليشبه بطاقة ائتمان
                width: 320, // عرض أكبر ليشبه بطاقة ائتمان
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade800,
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/homebanner.jpg'), // تأكد من وضع الصورة في مجلد assets
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),

            // شبكة الأزرار في أسفل الشاشة
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8, // تقليل التباعد العرضي
                mainAxisSpacing: 8, // تقليل التباعد الطولي
                children: [
                  _buildActionButton(
                      context, 'سحب', Icons.money_off, Colors.orange, () {
                    Navigator.pushNamed(context, '/withdraw');
                  }),
                  _buildActionButton(
                      context, 'إيداع', Icons.attach_money, Colors.amber, () {
                    Navigator.pushNamed(context, '/deposit');
                  }),
                  _buildActionButton(context, 'الدعم الفني',
                      Icons.support_agent, Colors.purple, () {
                    Navigator.pushNamed(context, '/support');

                    // تنفيذ كود الدعم هنا
                  }),
                  _buildActionButton(
                      context, 'دعوة صديق', Icons.group_add, Colors.teal, () {
                    Navigator.pushNamed(context, '/invite');
                    // تنفيذ كود دعوة فريق هنا
                  }),
                  _buildActionButton(
                      context, 'الفريق', Icons.group, Colors.blue, () {
                    Navigator.pushNamed(context, '/team');
                    // تنفيذ كود الإعدادات هنا
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة لإنشاء زر خاص بتصميم مشابه للأيقونات في الصورة الأصلية
  Widget _buildActionButton(BuildContext context, String label, IconData icon,
      Color color, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF162447), // لون الخلفية الداكنة للأيقونة
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // تقليل الظل
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent, // خلفية شفافة لمنع خطوط إضافية
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: color), // تقليل حجم الأيقونة قليلاً
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
