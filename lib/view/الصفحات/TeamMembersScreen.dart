import 'package:flutter/material.dart';

class TeamMembersScreen extends StatelessWidget {
  const TeamMembersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Color.fromARGB(255, 255, 255, 255), // تغيير اللون إلى الأسود الغامق
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'دعوة صديق',
              style: TextStyle(
                  color: const Color.fromARGB(255, 3, 3, 3),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.language, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Color(0xFFF6F7F9), // تغيير اللون إلى الرمادي الفاتح
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'فريق الإحالة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'لقد قمت بدعوة 0 من الرواد الجدد.\nإجمالي أعضاء فريق الإحالة الخاص بك: 0.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(
                              0xFFB0B0B0), // تعديل اللون إلى الرمادي الفاتح
                          fontSize: 14),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(
                            255, 3, 3, 3), // تعديل اللون إلى الأصفر
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'غير نشط',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Members',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton<String>(
                  value: 'عرض الجميع',
                  items: <String>['عرض الجميع', 'عرض النشطين']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (_) {},
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Center(
                child: Text(
                  'لم ينضم أحد إلى فريق الإحالة الخاص بك حتى الآن.\nاحصل على المزيد من خلال دعوة الأصدقاء.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color:
                          Color(0xFFB0B0B0), // تعديل اللون إلى الرمادي الفاتح
                      fontSize: 14),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(
                        color: Color.fromARGB(
                            255, 16, 14, 9)), // تعديل اللون إلى الأصفر
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'غرفة دردشة فريق الإحالة',
                    style: TextStyle(
                        color: Color.fromARGB(
                            255, 108, 76, 0)), // تعديل اللون إلى الأصفر
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color.fromARGB(255, 0, 0, 0), // تعديل اللون إلى الأصفر
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'دعوة المزيد',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
