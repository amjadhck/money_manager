import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(size.width * 0.0001250, size.height * 0.2493500);
    path0.quadraticBezierTo(size.width * 0.2337969, size.height * 0.1356500,
        size.width * 0.3116875, size.height * 0.0977500);
    path0.cubicTo(
        size.width * 0.3747000,
        size.height * 0.0480000,
        size.width * 0.3752750,
        size.height * 0.1481000,
        size.width * 0.3750000,
        size.height * 0.2500000);
    path0.cubicTo(
        size.width * 0.3748875,
        size.height * 0.9294500,
        size.width * 0.6241500,
        size.height * 0.9257500,
        size.width * 0.6250000,
        size.height * 0.2500000);
    path0.cubicTo(
        size.width * 0.6247000,
        size.height * 0.1371500,
        size.width * 0.6245750,
        size.height * 0.0359500,
        size.width * 0.6885875,
        size.height * 0.0933000);
    path0.quadraticBezierTo(size.width * 0.7655031, size.height * 0.1322375,
        size.width, size.height * 0.2490500);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
