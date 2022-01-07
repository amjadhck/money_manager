import 'package:flutter/material.dart';
import 'package:money_manager/widgets/custom_painter.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: size.width,
            height: 80,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                CustomPaint(
                  size: Size(size.width, 80),
                  painter: RPSCustomPainter(),
                ),
                Container(
                  width: size.width,
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
