import 'package:flutter/material.dart';
import 'package:invest/core/constant/colore.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/DepositScreen.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/InviteFriendScreen.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/TeamMembersScreen.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/home_screen.dart';
import 'package:invest/view/%D8%A7%D9%84%D8%B5%D9%81%D8%AD%D8%A7%D8%AA/withdraw_screen.dart';

class Navigation_Bar extends StatefulWidget {
  @override
  _Navigation_BarState createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation_Bar> {
  int _selectedIndex = 4; // تعيين العنصر الافتراضي (الرئيسية)
  PageController _pageController =
      PageController(initialPage: 4); // تعيين الصفحة الافتراضية

  final List<Widget> _screens = [
    InviteFriendScreen(), // الشاشة دعوه صديق
    TeamMembersScreen(), // شاشة الفريق
    WithdrawScreen(), // شاشة السحب
    DepositScreen(), // شاشة الإيداع
    HomeScreen(), // شاشة القائمه الرئيسه
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex =
          index; // تعيين العنصر المختار بناءً على الأيقونة التي تم الضغط عليها
    });
    _pageController
        .jumpToPage(index); // التنقل إلى الصفحة المختارة في `PageView`
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController, // ربط الـ `PageController` بـ `PageView`
        onPageChanged: (index) {
          setState(() {
            _selectedIndex =
                index; // تحديث العنصر المختار عند تغيير الصفحة بالسحب
          });
        },
        children: _screens, // عرض الشاشات داخل `PageView`
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // عند الضغط على أيقونة في شريط التنقل
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add),
            label: 'دعوه صديق',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'الفريق',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: 'سحب',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'إيداع',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
        ],
        selectedItemColor: AppColor.one,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }

  @override
  void dispose() {
    _pageController
        .dispose(); // التخلص من الـ PageController لتجنب تسريب الذاكرة
    super.dispose();
  }
}
