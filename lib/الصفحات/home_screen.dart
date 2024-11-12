import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invest/controller/auth/home_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeScreenControllerimp controller = Get.put(HomeScreenControllerimp());

    return Scaffold(
      backgroundColor:
          Color(0xFFF6F7F9), // لون الخلفية الفاتح كما في الأكواد السابقة
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: Icon(Icons.menu, color: Colors.black), // لون الأيقونة أسود
            onPressed: () {
              // Handle menu icon press
            },
          ),
        ),
        title: Text(
          'منصة التداول',
          style: TextStyle(
            color: Colors.black, // لون النص أسود
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle,
                size: 36, color: Colors.black), // لون الأيقونة أسود
            onPressed: () {
              controller.goToProfileScreen();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'MOHAMMED.78.1',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black, // لون النص أسود
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildActionButton(
                      context, 'فريقي', Icons.group, Color(0xFFE6A919), () {
                    controller.gotoTeamMembersScreen();
                  }),
                  _buildActionButton(
                      context, 'إيداع', Icons.attach_money, Color(0xFFE6A919),
                      () {
                    controller.gotoDepositScreen();
                  }),
                  _buildActionButton(
                      context, 'سحب', Icons.money_off, Color(0xFFE6A919), () {
                    controller.gotoWithdrawScreen();
                  }),
                  _buildActionButton(
                      context, 'الدعم الفني', Icons.support, Color(0xFFE6A919),
                      () {
                    controller.gotoNewSupportScreen();
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String label, IconData icon,
      Color color, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.8),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: Colors.black), // لون الأيقونة أسود
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black, // لون النص أسود
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
