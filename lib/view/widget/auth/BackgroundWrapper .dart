import 'package:flutter/material.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // صورة الخلفية
        Positioned.fill(
          child: Image.asset(
            'assets/images/Background.jpg',
            fit: BoxFit.cover,
          ),
        ),
        // محتوى الصفحة
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
