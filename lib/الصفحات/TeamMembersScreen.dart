import 'package:flutter/material.dart';

class TeamMembersScreen extends StatelessWidget {
  TeamMembersScreen({Key? key}) : super(key: key);

  // قائمة بعينات من أعضاء الفريق للتوضيح
  final List<Map<String, String>> teamMembers = [
    {'name': 'أحمد', 'dateJoined': '2024-11-01', 'status': 'نشط'},
    {'name': 'سارة', 'dateJoined': '2024-11-05', 'status': 'غير نشط'},
    {'name': 'خالد', 'dateJoined': '2024-11-07', 'status': 'نشط'},
    // يمكنك إضافة المزيد من الأعضاء هنا...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفريق', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          // زر الرجوع
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // يرجع إلى الشاشة السابقة
          },
        ),
      ),
      backgroundColor: Color(0xFF1B1B2F), // لون الخلفية الداكنة
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أعضاء الفريق الذين انضموا عبر الدعوة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: teamMembers.length,
                itemBuilder: (context, index) {
                  final member = teamMembers[index];
                  return Card(
                    color: Color(0xFF162447), // خلفية داكنة للبطاقة
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal, // لون الرمز الدائري
                        child: Text(
                          member['name']![0], // أول حرف من الاسم
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        member['name']!,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'تاريخ الانضمام: ${member['dateJoined']}',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                      trailing: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: member['status'] == 'نشط'
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          member['status']!,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
