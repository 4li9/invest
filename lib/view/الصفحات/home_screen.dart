import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Duration _countdownDuration = const Duration(hours: 24);
  late Duration _remainingDuration;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingDuration = _countdownDuration;
  }

  void _startCountdown() {
    if (_timer != null && _timer!.isActive) return;

    setState(() {
      _remainingDuration =
          _countdownDuration; // إعادة تعيين الوقت عند كل تشغيل.
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingDuration.inSeconds > 0) {
        setState(() {
          _remainingDuration -= const Duration(seconds: 1);
        });
      } else {
        timer.cancel();
        setState(() {
          _remainingDuration =
              _countdownDuration; // إعادة ضبط الوقت بعد انتهاء العد.
        });
      }
    });
  }

  String _formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(2, '0');
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF00A99D),
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(), // تفعيل التمرير السلس
            child: Container(
              color: const Color(0xFFEFF7F8),
              child: Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, Mohammed Fouad",
                              style: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "#TH1731683650501",
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: const Color(0xFF00A99D),
                              ),
                            ),
                          ],
                        ),
                        Icon(Icons.help_outline,
                            color: Colors.black54, size: 24.sp),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.attach_money,
                                  color: const Color(0xFF00A99D), size: 32.sp),
                              SizedBox(width: 8.w),
                              Text(
                                "راســــــــــــ الــــــــــــــمال",
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              const Spacer(),
                              Icon(Icons.info_outline,
                                  color: Colors.grey, size: 20.sp),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "0 USDT",
                            style: GoogleFonts.poppins(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "5/12/2024/ ..استـثـمــرت يــوم",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00A99D),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "الأربـــــــــــاح   ",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(Icons.info_outline,
                                        color: const Color(0xFFE0E0E0),
                                        size: 20.sp),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  "0",
                                  style: GoogleFonts.poppins(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  "≈ 0 USDT",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.h, horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1B1B2F),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "مبـلــغ السحـــب",
                                      style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(Icons.info_outline,
                                        color: Colors.white70, size: 20.sp),
                                  ],
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  "0 USDT",
                                  style: GoogleFonts.poppins(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: GestureDetector(
                        onTap: _startCountdown,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 192.w,
                              height: 192.w,
                              child: CircularProgressIndicator(
                                value: 1 -
                                    (_remainingDuration.inSeconds /
                                        _countdownDuration.inSeconds),
                                strokeWidth: 10.w,
                                backgroundColor: Colors.grey[300],
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Color(0xFF00A99D)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 160.w,
                              height: 160.w,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                _formatDuration(_remainingDuration),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF00A99D),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
