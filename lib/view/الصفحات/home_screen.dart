import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:invest/controller/auth/home_controller.dart';
import 'package:invest/view/widget/auth/BackgroundWrapper%20.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenControllerimp controller = Get.put(HomeScreenControllerimp());

  late Timer _timer;
  Duration _remainingTime = const Duration(hours: 24);
  bool _isDollarButtonEnabled = true;
  double remainingBalance = 93.62;
  double depositAmount = 100.00;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        setState(() {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        });
      } else {
        setState(() {
          _isDollarButtonEnabled = true;
        });
        _timer.cancel();
      }
    });
  }

  void _onDollarButtonPressed() {
    setState(() {
      _isDollarButtonEnabled = false;
      _remainingTime = const Duration(hours: 24);
    });
    _startTimer();
  }

  String _formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(2, '0');
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'مرحباً بك',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(Icons.account_circle,
                    size: 36, color: Colors.white),
                onPressed: () {
                  controller.goToProfileScreen();
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildCombinedInfoBox(),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(151, 100, 100, 100),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildActionButton(context, 'سحب', Icons.money_off, () {
                        controller.gotoWithdrawScreen();
                      }),
                      _buildActionButton(context, 'إيداع', Icons.attach_money,
                          () {
                        controller.gotoDepositScreen();
                      }),
                      _buildActionButton(
                          context, 'الدعم الفني', Icons.support_agent, () {
                        controller.gotoNewSupportScreen();
                      }),
                      _buildActionButton(context, 'دعوة صديق', Icons.group_add,
                          () {
                        controller.gotoInviteFriendScreen();
                      }),
                      _buildActionButton(context, 'الفريق', Icons.group, () {
                        controller.gotoTeamMembersScreen();
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCombinedInfoBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF21262D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withOpacity(0.5), width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBalanceButton(
                amount: depositAmount,
                label: ' الأربــاح  ',
                onPressed: () {
                  setState(() {
                    if (depositAmount >= 10) {
                      depositAmount -= 10;
                    }
                  });
                },
              ),
              _buildBalanceButton(
                amount: remainingBalance,
                label: 'رأس المال',
                onPressed: () {
                  setState(() {
                    remainingBalance += 10;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isDollarButtonEnabled ? _onDollarButtonPressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.withOpacity(0.2),
              side: BorderSide(color: Colors.blueAccent.withOpacity(0.5)),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Icon(
              Icons.attach_money,
              color: Colors.white,
              size: 48,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _formatDuration(_remainingTime),
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceButton({
    required double amount,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        Text(
          amount.toStringAsFixed(2),
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            side: BorderSide(color: Colors.blueAccent.withOpacity(0.5)),
          ),
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 30,
                color: const Color.fromARGB(
                    255, 0, 0, 0)), // الأيقونة فقط بدون خلفية
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
